0010 ' =================================
0020 ' AGENDA TELEFONICA TBC
0030 ' MANOEL NETO - 2025 
0040 ' =================================
0050 SCREEN 0:COLOR 2,0,0
0060 CLS:KEY OFF:DEFINT A-Z
0070 OPEN "AGENDA.DAT" AS #1 LEN=60
0080 FIELD #1, 50 AS N$, 10 AS T$
0090 R=1
0100 LOCATE 1,1:PRINT "AGENDA TELEFONICA"
0110 PRINT "Nome <ENTER para sair>:"
0120 INPUT NO$
0130 IF NO$="" THEN CLOSE #1:END
0140 IF LEN(NO$) > 50 THEN PRINT "Nome muito longo! Tente novamente.": GOTO 120
0150 PRINT "Digite o telefone:"
0160 INPUT TL$
0170 IF LEN(TL$) > 10 THEN PRINT "Telefone muito longo! Tente novamente.": GOTO 160
0180 IF TL$="" THEN PRINT "Telefone nao pode ser vazio! Tente novamente.": GOTO 160
0190 ' PREPARA A GRAVACAO DO REGISTRO'
0200 LSET N$ = NO$
0210 LSET T$ = TL$
0220 PUT #1, R
0230 R = R + 1
0240 NO$="":TL$=""
0250 GOTO 110