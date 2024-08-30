psect	text
global	_CarregaMatriz
_CarregaMatriz:
global	ncsv, cret, indir
call	ncsv
defw	f30
ld	(ix+-2),.low.0
ld	(ix+1+-2),.high.0
jp	l6
l3:
ld	(ix+-4),.low.0
ld	(ix+1+-4),.high.0
jp	l10
l7:
ld	e,(ix+-4)
ld	d,(ix+1+-4)
ld	l,(ix+-2)
ld	h,(ix+1+-2)
or	a
sbc	hl,de
jp	nz,l11
global	_matriz
ld	l,(ix+-4)
ld	h,(ix+1+-4)
add	hl,hl
ex	de,hl
push	de
ld	de,6
ld	l,(ix+-2)
ld	h,(ix+1+-2)
global	amul
call	amul
pop	de
add	hl,de
ld	de,_matriz
add	hl,de
ld	de,1
ld	(hl),e
inc	hl
ld	(hl),d
jp	l12
l11:
ld	l,(ix+-4)
ld	h,(ix+1+-4)
add	hl,hl
ex	de,hl
push	de
ld	de,6
ld	l,(ix+-2)
ld	h,(ix+1+-2)
global	amul
call	amul
pop	de
add	hl,de
ld	de,_matriz
add	hl,de
ld	de,0
ld	(hl),e
inc	hl
ld	(hl),d
l12:
l9:
ld	l,(ix+-4)
ld	h,(ix+1+-4)
inc	hl
ld	(ix+-4),l
ld	(ix+1+-4),h
l10:
ld	de,3
ld	l,(ix+-4)
ld	h,(ix+1+-4)
global	wrelop
call	wrelop
jp	alt,l7
l8:
l5:
ld	l,(ix+-2)
ld	h,(ix+1+-2)
inc	hl
ld	(ix+-2),l
ld	(ix+1+-2),h
l6:
ld	de,3
ld	l,(ix+-2)
ld	h,(ix+1+-2)
g