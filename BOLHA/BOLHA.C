/*
Ordenacao de vetor 
usando metodo bolha
*/
#include "fusion-c/header/msx_fusion.h"

int intVetor[5];

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
  int j;
  for(j=0;j<5;j++)
  {
    PrintNumber(intVetor[j]);
  }
  Print("\n");
}

void main(void) 
{
  int i,aux=0,bolha,lsup=4;
  CarregarVetor();
  Print("Vetor Inicial=>");
  ImprimirVetor();
  while(lsup>0)
  {
    Print("Limite Superior ");
    PrintNumber(lsup);
    Print("\n=================\n");
    bolha=0;
    for(i=0;i<=lsup-1;i++)
    {
      if(intVetor[i]>intVetor[i+1])
      {
        aux=intVetor[i];
        intVetor[i]=intVetor[i+1];
        intVetor[i+1]=aux;
        bolha=i;
        PrintNumber(i);
        Print("=>");
        ImprimirVetor();
      }
    }
    lsup=bolha;
  }
}