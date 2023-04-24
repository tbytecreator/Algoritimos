010 ' ============================'
020 ' ESSE ALGORITIMO CONTA COISAS'
030 ' ============================'
040 KEY OFF:SCREEN 0:WIDTH 40:CLS
050 DEFINT A-Z
060 DIM CO(4)
070 GOSUB 1000:' INICIALIZAR NOTAS
080 ? "Digite uma opcao abaixo         "
090 ? "================================"
100 ? "(B)aixar a nota de um cozinheiro"
110 ? "(F)inalizar o dia               "
120 ? "================================"
130 ? ">";
140 OP$=INPUT$(1)
150 IF OP$="b" OR OP$="B" THEN 2000:'BAIXAR NOTA
160 IF OP$="f" OR OP$="F" THEN 3000:'FINALIZAR
170 GOTO 80
1000 ' INICIALIZAR NOTAS
1010 FOR I = 0 TO 4
1020   CO(I)=10
1030 NEXT 
1040 RETURN
2000 ' BAIXAR NOTA 
2010 ? "Qual cozinheiro? (0-4)"
2020 ? "================================"
2030 INPUT ">";ID
2040 IF ID<0 OR ID>4 THEN ? "Codigo de cozinheiro invalido!":GOTO 80
2050 NA = CO(ID)
2060 NA = NA-1
2070 CO(ID)=NA
2080 GOTO 80
3000 ' FINALIZA O DIA 
3010 ?:? "Notas Finais"
3020 ? "==============================="
3030 FOR F=0 TO 4
3040   ? "Cozinheiro ";F;"=>";CO(F)
3050 NEXT
3060 ? "==============================="