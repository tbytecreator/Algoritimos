#include <stdio.h>
#include "fusion-c/header/msx_fusion.h"

// -----------------------------------
// PREPARAR A TELA 
// -----------------------------------
void PrepararTela()
{
    Screen(0);
    Width(40);
    Cls();
}

int RecebeNumero()
{
    char numero[1];
    Print("Digite um número decimal:");
    InputString(numero,1);
    return numero;
}

// -----------------------------------
// CALCULA O PRODUTO VETORIAL  
// -----------------------------------
int ProdutoVetorial(int *vetor1, int *vetor2, int tam)
{
    int i;
    int produto = 0;
    
    for (i=0; i<tam; i++)
    {
        produto += vetor1[i] * vetor2[i];
    }
    return produto;
}

// -----------------------------------
// FUNCAO MAIN
// -----------------------------------
void main(void)
{
    int vetor1[5];
    int vetor2[5];
    int produto = 0;

    PrepararTela();
    Print("Calculo do Produto Vetorial 1.0\n");
    Print("Manoel Neto 2024-06-26\n");
    Print("-----------------------------\n");
    Print("Preencher o vetor1 com 5 elementos:\n");
    for i = 0 to 4 vetor1[i] = RecebeNumero();
    Print("Preencher o vetor2 com 5 elementos:\n");
    for i = 0 to 4 vetor2[i] = RecebeNumero();
    produto = ProdutoVetorial(vetor1, vetor2, 5);
    Print("O produto vetorial eh: ");
    Print("-----------------------------\n");
    PrintDec(produto);
    Exit(0);
}
