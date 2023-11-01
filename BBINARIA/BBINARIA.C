// ===================================
// BUSCA BINARIA EM UM ARRAY 
// ===================================
// MANOEL NETO - 2023-10-31
// ===================================
#include <stdlib.h>
#include <stdio.h>
#include <math.h> 
#include "fusion-c/header/msx_fusion.h"

int pesos[10];
TIME tm;

char RandomNumber(char min, char max)
{  
    char random;
    random = rand()%(max-min)+min;              
    return(random);
}

void CarregarVetor()
{
  int i;
  int size = sizeof(pesos) / sizeof(pesos[0]);

  for(i=0;i<size;i++)
  {
    pesos[i]=RandomNumber(1,26);
  }
}

void ImprimirVetor()
{
  int i;
  int size = sizeof(pesos) / sizeof(pesos[0]);

  Print("\n-----------------------------");
  Print("\n00 01 02 03 04 05 06 07 08 09");
  Print("\n-----------------------------\n");
  for(i=0;i<size;i++)
  {
    PrintFNumber(pesos[i],48,2);
    Print(" ");
  }
  Print("\n-----------------------------\n");
}

void OrdenarVetor()
{
  int i,bolha,aux=0;
  int limiteSuperior = sizeof(pesos) / sizeof(pesos[0]);
  
  while(limiteSuperior>0)
  {
    bolha=0;
    for(i=0;i<=limiteSuperior-1;i++)
    {
      if(pesos[i]>pesos[i+1])
      {
        aux=pesos[i];
        pesos[i]=pesos[i+1];
        pesos[i+1]=aux;
        bolha=i;
      }
    }
    limiteSuperior=bolha;
  }
}

int BuscaBinaria(int valorProcurado)
{
    int chute=0,min=0;
    int size = sizeof(pesos) / sizeof(pesos[0]);

    while(size > min)
    {
      chute=(size+min)/2;
      PrintNumber(chute);
      if(pesos[chute]==valorProcurado)
      {
        return(chute);
      }
      else
      {
        if(pesos[chute]<valorProcurado)
        {
          min = chute+1;
        }
        else
        {
          size = chute-1;
        }
      }
      Print("");
    }
    return(-1);
}

void main(void) 
{
  char* valorProcurado;
  int posicaoNoVetor=-1;
  
  GetTime(&tm);               
  srand(tm.sec);
     
  CarregarVetor();
  Print("\nVetor Inicial");
  ImprimirVetor();
  OrdenarVetor();
  Print("\nVetor Ordenado");
  ImprimirVetor();
  Print("\nEntre um peso:");
  InputString(valorProcurado,4);
  posicaoNoVetor=BuscaBinaria(atoi(valorProcurado));
  Print("\nPosicao no vetor=>");
  PrintNumber(posicaoNoVetor);
  Print("\n");
}