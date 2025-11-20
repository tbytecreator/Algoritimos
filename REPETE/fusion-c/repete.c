#include <stdio.h>
#include <string.h>
#include "fusion-c/header/msx_fusion.h"

// ===================================
// Exemplo chamada de sala de aula
// ===================================
// MANOEL NETO - 2025-11-20
// FUSION-C / MSX
// ===================================

// estruturas 
typedef struct 
{
  char nome[30];
} Aluno;

// variaveis
Aluno alunos[50];
int totalAlunos = 0;

// funções
void ReceberAluno(Aluno *a)
{
  Print("Nome do aluno: ");
  InputString(a->nome, 29);
}

void GravarAluno(Aluno a)
{
  alunos[totalAlunos] = a;
  totalAlunos++;
}

int main() 
{
  Aluno alunoPresente;
  int i;
  
  // Configurar tela
  Screen(0);
  Width(40);
  Cls();
  
  Print("=== CHAMADA DE SALA ===\n\n");
  
  // comeca a repetição
  while(1)
  {
    Print("Digite o nome (ou Enter para terminar)\n");
    ReceberAluno(&alunoPresente);
    
    // Se nome vazio, sai do loop
    if(alunoPresente.nome[0] == '\0' || alunoPresente.nome[0] == '\n')
      break;
      
    GravarAluno(alunoPresente);
    Print("\n");
  }

  // imprime os alunos registrados
  Print("\n=== ALUNOS PRESENTES ===\n");
  for (i = 0; i < totalAlunos; i++) 
  {
    PrintDec(i+1);
    Print(". ");
    Print(alunos[i].nome);
    Print("\n");
  }
  
  Print("\nTotal: ");
  PrintDec(totalAlunos);
  Print(" alunos\n");
  
  // Aguardar tecla
  Print("\nPressione qualquer tecla...");
  WaitKey();

  return 0;
}