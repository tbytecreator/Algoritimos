#include <stdio.h>

int matriz[2][5];

int RecebeNumero(void)
{
    int numero;
    printf("Digite um numero decimal:");
    scanf("%d",&numero);
    return numero;
}

void main(void)
{
    int produto=0,j=0,val1,val2;
    
    for (j=0;j<5;j++)
    {
        matriz[0][j]=RecebeNumero();
        matriz[1][j]=RecebeNumero();
    }
   
    for (j=0;j<5;j++)
    {
        val1=matriz[0][j];
        val2=matriz[1][j];
        produto+=val1*val2;
    }
  
    printf("O produto vetorial e: %d",produto);
}