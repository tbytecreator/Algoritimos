//------------------------------------
// Fusion-C
// Campo de estrelas
// MANOEL NETO 2024-02-18
//------------------------------------
#include "stdio.h"
#include "stdlib.h"
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph1.h"
#include "fusion-c/header/vdp_circle.h"

TIME tm;  //Init the Time Structure variable

typedef struct 
{
    int x;
    int y;
    int z;
} Star;

// crie um array de 100 estrelas
Star stars[100];

// a rnd Number between a and b-1
char FT_RandomNumber (char a, char b)
{
    char random;
    random = rand()%(b-a)+a;  
    return(random);
}

// Generates a pause in the execution of n interruptions.
// PAL: 50=1second. ; NTSC: 60=1second. 
void Wait(int cicles)
{
  int i;
  for(i=0;i<cicles;i++) Halt();
  return;
}

void InitStars() 
{
  GetTime(&tm);          
  srand(tm.sec);
  for (int i = 0; i < 100; i++) 
  {
    stars[i].x = FT_RandomNumber(5,250);
    stars[i].y = FT_RandomNumber(5,190);
    stars[i].z = FT_RandomNumber(1,4);
  }
}

void Debug()
{
  for (int i = 0; i < 100; i++) 
  {
    PrintNumber(stars[i].x);
    Print(" ");
    PrintNumber(stars[i].y);
    Print(" ");
    PrintNumber(stars[i].z);
    Print("\n");
  }
}

void main(void) 
{
  // EFEITO CAMPO DE ESTRELAS 
  Screen(2);
  SetColors(15,1,1);
  //SC2BoxFill(0, 0, 256, 191,1);
  Cls();
  InitStars();
  for (int i = 0; i < 100; i++) 
  {
    SC2CircleFilled(stars[i].x, stars[i].y,stars[i].z,15);
  }
}