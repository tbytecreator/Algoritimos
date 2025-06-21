0010 ' =================================
0020 ' AGENDA TELEFONICA TBC
0030 ' MANOEL NETO - 2025 
0040 ' =================================
0050 SCREEN 0:COLOR 2,0,0
0060 KEY OFF:DEFINT A-Z
0070 OPEN "AGENDA.DAT" AS #1 LEN=30
0080 FIELD #1,20 AS N$,10 AS T$
0090 R=LOF(1)/30

0100 CLS:LOCATE 0,1:PRINT "AGENDA TELEFONICA"
0110 PRINT "======================================"
0120 PRINT "(L)er agenda                          "
0130 PRINT "(G)ravar agenda                       "
0140 PRINT "(S)air                                "
0150 PRINT "======================================"
0160 PRINT "Digite a opcao:";
0170 OP$=INPUT$(1)
0180 IF OP$="" THEN PRINT "Opcao nao pode ser vazia! Tente novamente.": GOTO 170
0200 IF OP$="L" THEN GOTO 1000
0210 IF OP$="G" THEN GOTO 2000
0220 IF OP$="S" THEN GOTO 3000
0230 PRINT "Opcao invalida! Tente novamente."
0240 GOTO 170
0250 '=========================================

1000 '=========================================
1010 ' LER AGENDA
1020 '=========================================
1022 PRINT
1025 PRINT "===================================="
1030 PRINT "Total de registros:";R
1040 PRINT "===================================="
1045 IF R=0 THEN GOTO 1120
1050 FOR I = 1 TO R
1060    GET #1,I
1070    PRINT"Indice   :"+STR$(I)
1080    PRINT"Nome     :"+N$
1090    PRINT"Telefone :"+T$
1100    PRINT "===================================="
1110 NEXT I
1120 PRINT "<ENTER> para continuar."
1130 OP$=INPUT$(1)
1140 GOTO 100
1150 '========================================= 

2000 '=========================================
2010 ' GRAVAR AGENDA
2020 '=========================================
2030 PRINT 
2040 INPUT "Nome <ENTER P/ SAIR>:"; NO$
2050 IF NO$="" THEN GOTO 100
2060 IF LEN(NO$) > 20 THEN PRINT:PRINT "Nome muito longo! Tente novamente.": GOTO 2040
2070 INPUT "Telefone:"; TL$
2090 IF LEN(TL$) > 10 THEN PRINT:PRINT "Telefone muito longo! Tente novamente.": GOTO 2070
2100 IF TL$="" THEN PRINT:PRINT "Telefone nao pode ser vazio! Tente novamente.": GOTO 2070
2105 R=R+1
2110 ' PREPARA A GRAVACAO DO REGISTRO'
2120 LSET N$=NO$
2130 LSET T$=TL$ 
2145 PUT #1,R
2160 NO$="":TL$=""
2170 PRINT "Registro gravado com sucesso!"
2180 PRINT "============================="
2190 GOTO 2030
2200 '==========================================

3000 '=========================================
3010 ' FIM DO PROGRAMA
3020 '=========================================
3025 PRINT
3030 PRINT "Obrigado por usar a agenda telefonica!"
3040 CLOSE #1
3050 END
3060 '=========================================