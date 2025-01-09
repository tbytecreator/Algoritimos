// ===================================
// Exemplo de criação de um tipo 
// registro 
// ===================================
// MANOEL NETO - 2025-1-6
// ===================================
#include <stdio.h>
#include <string.h>

int main(void) 
{
  typedef struct {
    char rua[50];
    int numero;
    char cidade[50];
    char estado[3];
    char cep[10];
  } Endereco;

  Endereco meuEndereco;

  strcpy(meuEndereco.rua, "Av. Paulista");
  meuEndereco.numero = 1578;
  strcpy(meuEndereco.cidade, "São Paulo");
  strcpy(meuEndereco.estado, "SP");
  strcpy(meuEndereco.cep, "01310-200");

  printf("Endereco\n");
  printf("==================================\n");
  printf("Rua: %s\n",meuEndereco.rua);
  printf("Numero: %d\n",meuEndereco.numero);
  printf("Cidade: %s\n",meuEndereco.cidade); 
  printf("Estado: %s\n",meuEndereco.estado); 
  printf("CEP: %s\n",meuEndereco.cep);
  printf("==================================\n");
}