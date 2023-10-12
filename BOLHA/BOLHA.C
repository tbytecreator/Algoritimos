// ===================================
// Ordenacao de vetor usando metodo 
// bolha
// ===================================
// MANOEL NETO - 2023-10-10
// ===================================
#include "fusion-c/header/msx_fusion.h"

int intVetor[5]; //0-4 (cinco posicoes) Escopo global

void CarregarVetor()
{
  intVetor[0]=3;
  intVetor[1]=1;
  intVetor[2]=5;
  intVetor[3]=4;
  intVetor[4]=2;
}

void ImprimirVetor()
{
  int i;
  for(i=0;i<5;i++)
  {
    PrintNumber(intVetor[i]);
  }
  Print("\n");
}

void TrocaPosicao(int index)
{
  int aux=0;
  aux=intVetor[index];
  intVetor[index]=intVetor[index+1];
  intVetor[index+1]=aux;
}

void main(void) 
{
  int i,bolha,limiteSuperior=4;
  CarregarVetor();
  Print("\nVetor Inicial=>");
  ImprimirVetor();
  Print("\n");
  while(limiteSuperior>0)
  {
    Print("Limite Superior ");
    PrintNumber(limiteSuperior);
    Print("\n=================\n");
    bolha=0;
    for(i=0;i<=limiteSuperior-1;i++)
    {
      if(intVetor[i]>intVetor[i+1])
      {
        TrocaPosicao(i);
        bolha=i;
        PrintNumber(i);
        Print("=>");
        ImprimirVetor();
      }
    }
    limiteSuperior=bolha;
    Print("\n");
  }
}