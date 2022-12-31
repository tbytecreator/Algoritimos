10 ' ============================'
20 ' ESSE ALGORITIMO CONTA COISAS'
30 ' ============================'
40 KEY OFF:SCREEN 0:WIDTH 40:CLS
50 DEFINT A-Z 
60 C=0 
70 ?"Existe chocolate (s/n)?":O$=INPUT$(1)
80 IF O$="N" OR O$="n" THEN 110 
90 C=C+1
100 GOTO 70 
110 ?"Existem ";C;" chocolates." 
120 END 