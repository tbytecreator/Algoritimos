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
char valorProcurado[2];
TIME tm;

float ceil_sdcc(float x) 
{
    int int_part = (int)x;
    if (x > int_part) 
    {
        return int_part + 1.0;
    } 
    else 
    {
        return x;
    }
}

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
    pesos[i]=RandomNumber(1,50);
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
  int limiteSuperior = (sizeof(pesos) / sizeof(pesos[0]))-1;
  
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
    int max = sizeof(pesos) / sizeof(pesos[0]);
    
    while(max>min)
    {
      Print("\nMinimo=>");
      PrintNumber(min);
      Print(" ");
      Print("\nMaximo=>");
      PrintNumber(max);
      Print(" ");
      chute=ceil_sdcc((max+min)/2);
      Print("\nChute Atual=>");
      PrintNumber(chute);
      Print(" ");
      
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
          max = chute-1;
        }
      }
    }
    return(-1);
}

void PegarPeso()
{
  Print("\nEntre um peso (0 para sair):");
  InputString(valorProcurado,5);
}

void main(void) 
{
  int posicaoNoVetor=-1;

  // cria uma semente para 
  // criacao de numeros aleatorios
  GetTime(&tm);               
  srand(tm.sec);

  // prepara o vetor de teste
  CarregarVetor();
  ImprimirVetor();
  OrdenarVetor();
  ImprimirVetor();
  
  // comeca o loop de pesquisas
  PegarPeso();
  while((int)valorProcurado!=0)
  {
    posicaoNoVetor=BuscaBinaria(atoi(valorProcurado));
    if (posicaoNoVetor!=-1)
    {
      Print("\nPosicao no vetor=>");
      PrintNumber(posicaoNoVetor);
      Print("\n");
    }
    else
    {
      Print("\nPeso nao encontrado.\n");
    }
    ImprimirVetor();
    PegarPeso();
  }
}