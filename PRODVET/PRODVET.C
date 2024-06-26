#include <stdio.h>
#include "fusion-c/header/msx_fusion.h"

// -----------------------------------
// PREPARAR A TELA 
// -----------------------------------
void PrepararTela(void)
{
    Screen(0);
    Width(40);
    Cls();
}

// -----------------------------------
// CALCULA O PRODUTO VETORIAL  
// -----------------------------------
int ProdutoVetorial(vetor1, vetor2)
{
    int i;
    int produto = 0;
    
    for (i=0; i<5; i++)
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
    InputDecimal("Digite o primeiro vetor: ", vetor1, 5);
    InputDecimal("Digite o segundo vetor: ", vetor2, 5);
    produto = ProdutoVetorial(vetor1, vetor2);
    Print("O produto vetorial eh: ");
    Print("-----------------------------\n");
    PrintDec(produto);
    Exit(0);
}
