// Teste simples para verificar FUSION-C
#include <stdio.h>
#include <string.h>
#include "msx_fusion.h"

void main(void) 
{
  // Configurar tela
  Screen(0);
  Width(40);
  Cls();

  // Teste simples de impressão
  Print("Teste FUSION-C\n");
  Print("==================================\n");
  Print("Linha 1\n");
  Print("Linha 2\n");
  Print("Linha 3\n");
  Print("==================================\n");
  
  // Aguardar tecla
  Print("\nPressione qualquer tecla...");
  WaitKey();
}
