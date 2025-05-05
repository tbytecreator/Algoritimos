0010 ' =====================================
0020 ' Ghea D&D BASIC Module
0030 ' =====================================
0040 SCREEN 0:COLOR 2,0,0:KEYOFF:OP=0:MX=0

0060 ' =====================================
0070 ' CARREGA AS OPCOES DE MENU
0080 ' =====================================
0090 DIM A$(2,3)
0100 OPEN "MENU1.DAT" FOR INPUT AS #1
0110 LINE INPUT #1, R$
0120 A$(MX,1)=R$
0130 LINE INPUT #1, R$
0140 A$(MX,2)=R$
0150 LINE INPUT #1, R$
0160 A$(MX,3)=R$
0170 MX=MX+1
0180 IF NOT EOF(1) THEN 110
0190 CLOSE #1

0400 ' =====================================
0410 ' ACERTA AS FORMAS DOS CARACTERES
0420 ' ===================================== 
0430 FOR C=&H41*8 TO &H5A*8
0440   VPOKE C+256,VPEEK(C)
0450 NEXT C

0500 ' =====================================
0510 ' MUDA AS CORES DE FUNDO
0520 ' =====================================
0530 CL=&H12 : ' TEXTO PRETO/FUNDO VERDE
0540 VPOKE 8204,CL
0550 VPOKE 8205,CL
0560 VPOKE 8206,CL
0570 VPOKE 8207,CL
0580 VPOKE 8219,CL/16+(CL-(CL AND &HF0))*16

0600 ' =====================================
0610 ' DESENHA A TELA 
0620 ' =====================================
0630 GOSUB 9000:'DESENHA O HEADER
0640 GOSUB 8000:'DESENHA O CORPO
0650 GOSUB 10000:'DESENHA O FOOTER
0660 CY=10:GOSUB 5000:'DESENHA OPCOES DO MENU

0700 ' ===================================== 
0710 ' LOOP PRINCIPAL
0720 ' =====================================
0730 CY=10:GOSUB 7000:'DESENHA SELECAO
0740 K$=INKEY$:IF K$="" THEN 740
0750 K=ASC(k$)
0760 IF K=30 OR K=31 THEN CY=10:GOSUB 6000 
0770 IF K=31 THEN OP=(OP+1) MOD MX
0780 IF K=30 THEN OP=OP-1:IF OP=-1 THEN OP=MX-1
0790 IF K=13 THEN 2000 : ' EXECUTA A OPCAO
0800 IF K=27 THEN CLS:END
0899 GOTO 730

2000 ' =====================================
2010 ' EXECUTA A OPCAO
2020 ' =====================================
2030 OP$ = A$(OP,3) 
2040 RUN OP$+".BAS"
2999 END

3000 ' =====================================
3010 ' CRIA UMA LINHA CAIXA PARA BAIXO
3020 ' =====================================
3030 LOCATE 0,CY:PRINT CHR$(1)+CHR$(&H58);
3040 FOR I = 1 TO 38
3050   LOCATE I,CY
3060   PRINT CHR$(1)+CHR$(&H57);
3070 NEXT I
3080 LOCATE 39,CY:PRINT CHR$(1)+CHR$(&H59);
3090 RETURN

4000 ' =====================================
4010 ' CRIA UMA LINHA DE CAIXA PARA CIMA
4020 ' =====================================
4030 LOCATE 0,CY:PRINT CHR$(1)+CHR$(&H5A);
4040 FOR I = 1 TO 38
4050   LOCATE I,CY
4060   PRINT CHR$(1)+CHR$(&H57);
4070 NEXT I
4080 LOCATE 39,CY:PRINT CHR$(1)+CHR$(&H5B);
4090 RETURN

5000 ' =====================================
5010 ' DESENHA AS OPCOES DO MENU
5020 ' =====================================
5030 FOR F=0 TO MX
5050   LOCATE 10,F+CY:PRINT A$(F,1)
5070 NEXT F 
5080 RETURN

6000 ' =====================================
6010 ' DESENHA SELECAO
6020 ' =====================================
6030 LOCATE 10,OP+CY:PRINT A$(OP,1)
6040 RETURN

7000 ' =====================================
7010 ' DESENHA SELECAO
7020 ' =====================================
7030 LOCATE 10,OP+CY:PRINT A$(OP,2)
7040 RETURN

8000 ' =====================================
8010 ' DESENHA O CORPO
8020 ' =====================================
8030 CY=3:GOSUB 3000:'DESENHA CAIXA P/ BAIXO
8040 FOR I = 4 TO 18
8050   LOCATE 00,I:PRINT CHR$(1)+CHR$(&H56);
8060   LOCATE 39,I:PRINT CHR$(1)+CHR$(&H56);
8070 NEXT I
8080 CY=19:GOSUB 4000:'DESENHA CAIXA P/ CIMA
8090 RETURN

9000 ' =====================================
9010 ' DESENHA HEADER
9020 ' =====================================
9030 CY=0:GOSUB 3000:'DESENHA CAIXA P/ BAIXO
9040 LOCATE 0,1:PRINT CHR$(1)+CHR$(&H56)
9050 LOCATE 1,1:PRINT "GHEA D&D - BASIC MODULE          <ESC>"         
9070 LOCATE 39,1:PRINT CHR$(1)+CHR$(&H56)
9080 CY=2:GOSUB 4000:'DESENHA CAIXA P/ CIMA
9090 RETURN

10000 ' =====================================
10010 ' DESENHA O FOOTER
10020 ' =====================================
10030 CY=20:GOSUB 3000:'DESENHA CAIXA P/ BAIXO
10040 LOCATE 0,21:PRINT CHR$(1)+CHR$(&H56);
10060 LOCATE 1,21:PRINT "SE TEM PERSONAGEM, CONTINUE AVENTURA";
10070 LOCATE 39,21:PRINT CHR$(1)+CHR$(&H56);
10080 CY=22:GOSUB 4000:'DESENHA CAIXA P/ CIMA
10090 RETURN
