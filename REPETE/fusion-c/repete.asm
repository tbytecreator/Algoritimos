;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module repete
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _GravarAluno
	.globl _ReceberAluno
	.globl _WaitKey
	.globl _Width
	.globl _Screen
	.globl _Cls
	.globl _PrintDec
	.globl _InputString
	.globl _Print
	.globl _totalAlunos
	.globl _alunos
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_alunos::
	.ds 1500
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_totalAlunos::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;repete.c:22: void ReceberAluno(Aluno *a)
;	---------------------------------
; Function ReceberAluno
; ---------------------------------
_ReceberAluno::
;repete.c:24: Print("Nome do aluno: ");
	ld	de, #___str_0+0
	ex	de, hl
	push	de
	call	_Print
	pop	hl
;repete.c:25: InputString(a->nome, 29);
	ld	de, #0x001d
;repete.c:26: }
	jp	_InputString
_Done_Version_tag:
	.ascii "Made with FUSION-C 1.3 R21010 (c)EBSOFT:2021"
	.db 0x00
___str_0:
	.ascii "Nome do aluno: "
	.db 0x00
;repete.c:28: void GravarAluno(Aluno a)
;	---------------------------------
; Function GravarAluno
; ---------------------------------
_GravarAluno::
	call	___sdcc_enter_ix
;repete.c:30: alunos[totalAlunos] = a;
	ld	bc, #_alunos+0
	ld	de, (_totalAlunos)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #4
	add	hl, sp
	ld	bc, #0x001e
	ldir
;repete.c:31: totalAlunos++;
	ld	hl, (_totalAlunos)
	inc	hl
	ld	(_totalAlunos), hl
;repete.c:32: }
	pop	ix
	pop	hl
	ld	iy, #30
	add	iy, sp
	ld	sp, iy
	jp	(hl)
;repete.c:34: int main() 
;	---------------------------------
; Function main
; ---------------------------------
_main::
	call	___sdcc_enter_ix
	ld	hl, #-32
	add	hl, sp
	ld	sp, hl
;repete.c:40: Screen(0);
	xor	a, a
	call	_Screen
;repete.c:41: Width(40);
	ld	a, #0x28
	call	_Width
;repete.c:42: Cls();
	call	_Cls
;repete.c:44: Print("=== CHAMADA DE SALA ===\n\n");
	ld	hl, #___str_2
	call	_Print
;repete.c:47: while(1)
00105$:
;repete.c:49: Print("Digite o nome (ou Enter para terminar)\n");
	ld	hl, #___str_3
	call	_Print
;repete.c:50: ReceberAluno(&alunoPresente);
	ld	hl, #0
	add	hl, sp
	call	_ReceberAluno
;repete.c:53: if(alunoPresente.nome[0] == '\0' || alunoPresente.nome[0] == '\n')
	ld	a, -32 (ix)
	or	a, a
	jr	Z, 00106$
	sub	a, #0x0a
	jr	Z, 00106$
;repete.c:56: GravarAluno(alunoPresente);
	ld	hl, #0x1d
	add	hl, sp
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	dec	hl
	push	bc
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	push	bc
	call	_GravarAluno
;repete.c:57: Print("\n");
	ld	hl, #___str_4
	call	_Print
	jr	00105$
00106$:
;repete.c:61: Print("\n=== ALUNOS PRESENTES ===\n");
	ld	hl, #___str_5
	call	_Print
;repete.c:62: for (i = 0; i < totalAlunos; i++) 
	ld	bc, #0x0000
	ld	de, #_alunos+0
00109$:
	ld	hl, #_totalAlunos
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jp	PO, 00149$
	xor	a, #0x80
00149$:
	jp	P, 00107$
;repete.c:64: PrintDec(i+1);
	ld	l, c
	ld	h, b
	inc	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	push	bc
	push	de
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	call	_PrintDec
;repete.c:65: Print(". ");
	ld	hl, #___str_6
	call	_Print
	pop	de
	pop	bc
;repete.c:66: Print(alunos[i].nome);
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, de
	push	de
	call	_Print
;repete.c:67: Print("\n");
	ld	hl, #___str_4
	call	_Print
	pop	de
;repete.c:62: for (i = 0; i < totalAlunos; i++) 
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	jr	00109$
00107$:
;repete.c:70: Print("\nTotal: ");
	ld	hl, #___str_7
	call	_Print
;repete.c:71: PrintDec(totalAlunos);
	ld	hl, (_totalAlunos)
	call	_PrintDec
;repete.c:72: Print(" alunos\n");
	ld	hl, #___str_8
	call	_Print
;repete.c:75: Print("\nPressione qualquer tecla...");
	ld	hl, #___str_9
	call	_Print
;repete.c:76: WaitKey();
	call	_WaitKey
;repete.c:78: return 0;
	ld	de, #0x0000
;repete.c:79: }
	ld	sp, ix
	pop	ix
	ret
___str_2:
	.ascii "=== CHAMADA DE SALA ==="
	.db 0x0a
	.db 0x0a
	.db 0x00
___str_3:
	.ascii "Digite o nome (ou Enter para terminar)"
	.db 0x0a
	.db 0x00
___str_4:
	.db 0x0a
	.db 0x00
___str_5:
	.db 0x0a
	.ascii "=== ALUNOS PRESENTES ==="
	.db 0x0a
	.db 0x00
___str_6:
	.ascii ". "
	.db 0x00
___str_7:
	.db 0x0a
	.ascii "Total: "
	.db 0x00
___str_8:
	.ascii " alunos"
	.db 0x0a
	.db 0x00
___str_9:
	.db 0x0a
	.ascii "Pressione qualquer tecla..."
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__totalAlunos:
	.dw #0x0000
	.area _CABS (ABS)
