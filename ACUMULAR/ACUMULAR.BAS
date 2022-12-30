10 ' =====================================
20 ' ESTE PROGRAMA IMPLEMENTA EM MSX BASIC 
30 ' O ALGORITIMO DE ACUMULADOR 
40 ' =====================================
50 KEY OFF:CLS:SCREEN 0:WIDTH 40:CLS
60 DEFINT A-Z 
70 PS=0;AC=0
100 INPUT("Qual o peso da barra de chocolate (0 para sair) ",PS)
110 IF PS=0 THEN 140 
120 AC=AC+PS
130 GOTO 100
140 ?"A Soma dos pesos é:";AC
150 END
