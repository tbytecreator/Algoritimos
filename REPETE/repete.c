// ===================================
// Exemplo de criação de um tipo 
// registro 
// ===================================
// MANOEL NETO - 2025-1-6
// Adaptado para FUSION-C / MSX
// ===================================
#include <stdio.h>
#include <string.h>
#include "msx_fusion.h"

typedef struct {
  char rua[50];
  char numero[10];
  char cidade[50];
  char estado[3];
  char cep[10];
} Endereco;

void main(void) 
{
  Endereco meuEndereco;

  // Configurar tela
  Screen(0);
  Width(40);
  Cls();

  // Preencher dados do endereço
  strcpy(meuEndereco.rua, "Av. Paulista");
  strcpy(meuEndereco.numero, "1578");
  strcpy(meuEndereco.cidade, "Sao Paulo");
  strcpy(meuEndereco.estado, "SP");
  strcpy(meuEndereco.cep, "01310-200");

  // Exibir informações
  Print("Endereco\n");
  Print("==================================\n");
  Print("Rua: ");
  Print(meuEndereco.rua);
  Print("\n");
  Print("Numero: ");
  Print(meuEndereco.numero);
  Print("\n");
  Print("Cidade: ");
  Print(meuEndereco.cidade);
  Print("\n");
  Print("Estado: ");
  Print(meuEndereco.estado);
  Print("\n");
  Print("CEP: ");
  Print(meuEndereco.cep);
  Print("\n");
  Print("==================================\n");
  
  // Aguardar tecla
  Print("\nPressione qualquer tecla...");
  WaitKey();
}