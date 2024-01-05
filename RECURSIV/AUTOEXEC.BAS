010 ' ================================
020 ' LOADER                      
030 ' ================================
040 KEY OFF:SCREEN 0:WIDTH 40:CLS
050 DEFINT A-Z
060 ? "=============================="
070 ? "(1)Fatorial                   "
080 ? "(2)Arvore Fractal             "
090 ? "=============================="
100 ? ">";
110 OP$=INPUT$(1)
120 IF OP$="1" THEN RUN"FATORIAL.BAS"
130 IF OP$="2" THEN RUN"ARVORE.BAS" 
140 GOTO 60