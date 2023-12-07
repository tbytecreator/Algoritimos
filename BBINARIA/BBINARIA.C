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
    float chute,resto;
    int max = sizeof(pesos) / sizeof(pesos[0]),min=0,pos=-1;

    // testa se esta na pos 0
    if (pesos[0]==valorProcurado)
    {
      return(0);
    }
    
    // testa se esta na ultima posicao 
    if (pesos[max-1]==valorProcurado)
    {
      return(max-1);
    }

    while(max>min)
    {
      Print("\nMinimo=>");
      PrintNumber(min);
      Print(" ");
      Print("\nMaximo=>");
      PrintNumber(max);
      Print(" ");
      resto=(max+min)%2;  

      if (resto==0)
      {
        Print("\nNao teve resto\n");
        chute=(max+min)/2;
        pos=chute; 
      }
      else
      {
        Print("\nteve resto\n");
        pos=((max+min)/2)+1;
      }
      Print("Posicao=>");
      PrintNumber(pos);
      if(pesos[pos]==valorProcurado)
      {
        return(pos);
      }
      else
      {
        if(pesos[pos]<valorProcurado)
        {
          min = pos+1;
        }
        else
        {
          max = pos-1;
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
  while(atoi(valorProcurado)!=0)
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