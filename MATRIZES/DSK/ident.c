#include <stdio.h>

int matriz[3][3];

int CarregaMatriz(void)
{
    int i,j;
    for (i=0;i<3;i++)
    {
        for (j=0;j<3;j++)
        {
           if (i==j)
           {
               matriz[i][j]=1;
           }
           else
           {
               matriz[i][j]=0;
           }
        }
    }
    return 0;
}

void ImprimeMatriz(void)
{
    int i,j;
    for (i=0;i<3;i++)
    {
        for (j=0;j<3;j++)
        {
            printf("%d ",matriz[i][j]);
        }
        printf("\n");
    }
}

void main(void)
{   
   CarregaMatriz();
   printf("Matriz identidade:\n");
   ImprimeMatriz();
   printf("\n");
}