#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph1.h"
#include "fusion-c/header/io.h"

#define KEY_ESC 27
#define KEY_ENTER 13

typedef struct 
{
    char *texto;
    char *textoSelecionado;
} MenuItem;

// globals
static MenuItem *menuItems = NULL;
static int menuItemCount = 0;
static int selectedOption = 0;

void ExecuteOption()
{
    Cls();
    Locate(1,1);Print("A:\>");
    Print("WRTSST ");
    Print(menuItems[selectedOption].texto);
    WaitKey();
    Cls();
    Exit(0);
}

void AddMenuItem(const char *text) 
{
    char *upperText = strdup(text);
    StrToUpper(upperText);

    char *lowerText = strdup(text);
    StrToLower(lowerText);
    
    menuItems = (MenuItem *)realloc(menuItems, (menuItemCount + 1) * sizeof(MenuItem));
    menuItems[menuItemCount].texto = upperText;
    menuItems[menuItemCount].textoSelecionado = lowerText;
    menuItemCount++;
}

void DrawBox(int x, int y, int width, int height) 
{
    Locate(x,y);
    PrintChar(1);
    PrintChar(88);

    for (int i=0; i<width-2; i++) 
    {
        Locate(x+i+1,y);
        PrintChar(1);
        PrintChar(87);
    }

    Locate(width,y);
    PrintChar(1);
    PrintChar(89);

    for (int i=0; i<height-1; i++) 
    {
        Locate(x,y+i+1);
        PrintChar(1);
        PrintChar(86);

        Locate(width,y+i+1);
        PrintChar(1);
        PrintChar(86);
    }

    Locate(x,y+height);
    PrintChar(1);
    PrintChar(90);

    for (int i=0; i<width-2; i++) 
    {
        Locate(x+i+1,y+height);
        PrintChar(1);
        PrintChar(87);
    }

    Locate(width,y+height);
    PrintChar(1);
    PrintChar(91);
}

void ReadFiles()
{
    // Variable
    char sbuf[255];
    int n;
  
    // User interface 
    n=FindFirst("*.ROM",sbuf,0);
    for(;!n;)
    {
        AddMenuItem(sbuf);
        n=FindNext(sbuf);
    }
}

void PrintMenu()
{
    for (int i=0; i<menuItemCount; i++) 
    {
        Locate(1,4+i);
        if (i == selectedOption) 
        {
            Print(menuItems[i].textoSelecionado);
        } 
        else 
        {
            Print(menuItems[i].texto);
        }
    }
}

void IncreaseOption()
{
    selectedOption++;
    if (selectedOption >= menuItemCount) selectedOption = 0;
}

void DecreaseOption()
{
    selectedOption--;
    if (selectedOption < 0) selectedOption = menuItemCount - 1;
}

void PrepareChars()
{    
    for (int i=0x41*8;i<=0x5A*8;i++)
    {
        Vpoke(i+256, Vpeek(i));
    }
}

void ChangeColors()
{
    int color = 0x12; 
    Vpoke(8204,color);
    Vpoke(8205,color);
    Vpoke(8206,color);
    Vpoke(8207,color);
    Vpoke(8219,color/16+(color-(color && 0xF0))*16);
}

void main(void)
{
    int key;

    // prepara a tela
    Screen(1);
    SetColors(2, 0, 0);
    Cls();
    PrepareChars();
    ChangeColors();

    // desenha o menu
    DrawBox(0,0,40,2);
    Locate(1,1);Print("TBC SPIDER FLASH WRITER");
    DrawBox(0,3,40,15);
    DrawBox(0,19,40,2);
    Locate(1,20);Print("ESCOLHA UM ARQUIVO");
    
    ReadFiles();
    
    while(1)
    {
        PrintMenu();
        while(key=Inkey(),!key);
        if (key == KEY_ESC) break;
        if (key == 31) IncreaseOption();
        if (key == 30) DecreaseOption();
        if (key == KEY_ENTER) ExecuteOption();
    }
    Cls();
}