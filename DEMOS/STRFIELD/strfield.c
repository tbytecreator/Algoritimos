//------------------------------------
// Fusion-C
// Campo de estrelas
// MANOEL NETO 2024-02-18
//------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph2.h"
#include "fusion-c/header/vdp_circle.h"

TIME tm;  
#define NUMBEROFSTARS 100
#define WIDTH 512
#define HEIGHT 212

typedef struct 
{
    int x;
    int y;
    int z;
} Star;

Star stars[NUMBEROFSTARS];

// a rnd Number between a and b-1
int FT_RandomNumber (int a,int b)
{
    int random;
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
  for (int i = 0; i < NUMBEROFSTARS; i++) 
  {
    stars[i].x = FT_RandomNumber(0,WIDTH);
    stars[i].y = FT_RandomNumber(0,HEIGHT);
    stars[i].z = FT_RandomNumber(0,WIDTH);
  }
}

void CriarFundo()
{
  SetColors(15,1,1);
  Screen(7);
  Cls();
}

int MapearValor(int valor, int minEntrada, int maxEntrada, int minSaida, int maxSaida)
{
  return (valor - minEntrada) * (maxSaida - minSaida) / (maxEntrada - minEntrada) + minSaida;
}

void DesenharEstrelas()
{
  int sx,sy,r;
  
  Cls();
  for (int i = 0;i<NUMBEROFSTARS;i++) 
  {
    sx=MapearValor(stars[i].x/stars[i].z,0,2.41,0,WIDTH);
    sy=MapearValor(stars[i].y/stars[i].z,0,2.41,0,HEIGHT);
    r=MapearValor(stars[i].z,0,WIDTH,15,0);
    CircleFilled(sx,sy,r,15,0);
  }
}

void AtualizarEstrelas()
{
  for (int i=0;i<NUMBEROFSTARS;i++) 
  {
    stars[i].z -= 1;
    if (stars[i].z <= 0) 
    {
      stars[i].x = FT_RandomNumber(0,WIDTH);
      stars[i].y = FT_RandomNumber(0,HEIGHT);
      stars[i].z = FT_RandomNumber(0,WIDTH);
    }
  }
} 

void main(void) 
{
  CriarFundo();
  InitStars();
  while(1)
  {
    DesenharEstrelas();
    AtualizarEstrelas();
    Wait(50);
  }
}