10 ' ==================================
20 ' IMPLEMENTA EM MSX BASIC 
30 ' O ALGORITIMO DE MAIOR VALOR 
40 ' E MENOR VALOR  
50 ' ==================================
60 KEY OFF:SCREEN 0:WIDTH 40:CLS
70 DEFINT A-Z 
80 MA=0:ME=0:PS=0
90 READ PS
100 MA = PS
110 ME = PS 
120 IF PS=0 THEN 160 
130 IF PS > MA THEN GOSUB 200 ELSE IF PS < ME THEN GOSUB 300 
140 READ PS 
150 GOTO 120
160 ?"O maior peso e:";MA
170 ?"O menor peso e:";ME 
180 END
190 DATA 10,20,30,40,50,0
200 MA = PS:RETURN
300 ME = PS:RETURN