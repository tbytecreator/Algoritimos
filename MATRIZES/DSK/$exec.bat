CPP -DCPM -DHI_TECH_C -Dz80 -I IDENT.C $C1.T
P1 $C1.T $C2.T $C3.T
CGEN $C2.T $C1.T
ZAS -N -oIDENT.O $C1.T
DEL $C1.T
DEL $C2.T
DEL $C3.T
LINK -Z -Ptext=0,data,bss -C100H -OIDENT.COM CRT.O IDENT.O LIBC.LIB
DEL IDENT.O
