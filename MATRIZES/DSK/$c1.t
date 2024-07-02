psect	text
global	_RecebeNumero
_RecebeNumero:
global	ncsv, cret, indir
call	ncsv
defw	f30
global	_printf
ld	hl,19f
push	hl
call	_printf
ld	hl,2
add	hl,sp
ld	sp,hl
global	_scanf
push	ix
pop	hl
dec	hl
dec hl
push	hl
ld	hl,29f
push	hl
call	_scanf
ld	hl,2+2
add	hl,sp
ld	sp,hl
ld	l,(ix+-2)
ld	h,(ix+1+-2)
jp	l2
l2:
jp	cret
f30	equ	-2
global	_main
_main:
call	ncsv
defw	f31
ld	(ix+-2),.low.0
ld	(ix+1+-2),.high.0
ld	(ix+-4),.low.0
ld	(ix+1+-4),.high.0
ld	(ix+-4),.low.0
ld	(ix+1+-4),.high.0
jp	l7
l4:
global	_matriz
call	_RecebeNumero
exx
ld	hl,0
add	hl,sp
ld	sp,hl
exx
ld	e,l
ld	d,h
push	de
ld	de,_matriz
ld	l,(ix+-4)
ld	h,(ix+1+-4)
add	hl,hl
add	hl,de
pop	de
ld	(hl),e
inc	hl
ld	(hl),d
call	_RecebeNumero
exx
ld	hl,0
add	hl,sp
ld	sp,hl
exx
ld	e,l
ld	d,h
push	de
ld	de,_matriz+10
ld	l,(ix+-4)
ld	h,(ix+1+-4)
add	hl,hl
add	hl,de
pop	de
ld	(hl),e
inc	hl
ld	(hl),d
l6:
ld	l,(ix+-4)
ld	h,(ix+1+-4)
inc	hl
ld	(ix+-4),l
ld	(ix+1+-4),h
l7:
ld	de,5
ld	l,(ix+-4)
ld	h,(ix+1+-4)
global	wrelop
call	wrelop
jp	alt,l4
l5:
ld	(ix+-4),.low.0
ld	(ix+1+-4),.high.0
jp	l11
l8:
ld	de,_matriz
ld	l,(ix+-4)
ld	h,(ix+1+-4)
add	hl,hl
add	hl,de
ld	c,(hl)
inc	hl
ld	b,(hl)
ld	(ix+-6),c
ld	(ix+1+-6),b
ld	de,_matriz+10
ld	l,(ix+-4)
ld	h,(ix+1+-4)
add	hl,hl
add	hl,de
ld	c,(hl)
inc	hl
ld	b,(hl)
ld	(ix+-8),c
ld	(ix+1+-8),b
ld	e,(ix+-8)
ld	d,(ix+1+-8)
ld	l,(ix+-6)
ld	h,(ix+1+-6)
global	amul
call	amul
ex	de,hl
ld	l,(ix+-2)
ld	h,(ix+1+-2)
add	hl,de
ld	(ix+-2),l
ld	(ix+1+-2),h
l10:
ld	l,(ix+-4)
ld	h,(ix+1+-4)
inc	hl
ld	(ix+-4),l
ld	(ix+1+-4),h
l11:
ld	de,5
ld	l,(ix+-4)
ld	h,(ix+1+-4)
global	wrelop
call	wrelop
jp	alt,l8
l9:
ld	l,(ix+-2)
ld	h,(ix+1+-2)
push	hl
ld	hl,39f
push	hl
call	_printf
ld	hl,2+2
add	hl,sp
ld	sp,hl
l3:
jp	cret
f31	equ	-8
psect	data
19:
defb	68,105,103,105,116,101,32,117,109,32,110,117,109,101,114,111
defb	32,100,101,99,105,109,97,108,58,0
29:
defb	37,100,0
39:
defb	79,32,112,114,111,100,117,116,111,32,118,101,116,111,114,105
defb	97,108,32,101,58,32,37,100,0
psect	bss
_matriz:
	defs	20
1+-4),h
l11:
ld	de,5