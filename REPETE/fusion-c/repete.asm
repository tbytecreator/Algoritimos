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
	.globl _WaitKey
	.globl _Width
	.globl _Screen
	.globl _Cls
	.globl _Print
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;repete.c:20: void main(void) 
;	---------------------------------
; Function main
; ---------------------------------
_main::
	call	___sdcc_enter_ix
	ld	hl, #-123
	add	hl, sp
	ld	sp, hl
;repete.c:25: Screen(0);
	xor	a, a
	call	_Screen
;repete.c:26: Width(40);
	ld	a, #0x28
	call	_Width
;repete.c:27: Cls();
	call	_Cls
;repete.c:30: strcpy(meuEndereco.rua, "Av. Paulista");
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #___str_0
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
;repete.c:31: strcpy(meuEndereco.numero, "1578");
	ld	hl, #50
	add	hl, sp
	ex	de, hl
	ld	hl, #___str_1
	xor	a, a
00104$:
	cp	a, (hl)
	ldi
	jr	NZ, 00104$
;repete.c:32: strcpy(meuEndereco.cidade, "Sao Paulo");
	ld	hl, #60
	add	hl, sp
	ex	de, hl
	ld	hl, #___str_2
	xor	a, a
00105$:
	cp	a, (hl)
	ldi
	jr	NZ, 00105$
;repete.c:33: strcpy(meuEndereco.estado, "SP");
	ld	hl, #110
	add	hl, sp
	ex	de, hl
	ld	hl, #___str_3
	xor	a, a
00106$:
	cp	a, (hl)
	ldi
	jr	NZ, 00106$
;repete.c:34: strcpy(meuEndereco.cep, "01310-200");
	ld	hl, #113
	add	hl, sp
	ex	de, hl
	ld	hl, #___str_4
	xor	a, a
00107$:
	cp	a, (hl)
	ldi
	jr	NZ, 00107$
;repete.c:37: Print("Endereco\n");
	ld	hl, #___str_5
	call	_Print
;repete.c:38: Print("==================================\n");
	ld	hl, #___str_6
	call	_Print
;repete.c:39: Print("Rua: ");
	ld	hl, #___str_7
	call	_Print
;repete.c:40: Print(meuEndereco.rua);
	ld	hl, #0
	add	hl, sp
	call	_Print
;repete.c:41: Print("\n");
	ld	hl, #___str_8
	call	_Print
;repete.c:42: Print("Numero: ");
	ld	hl, #___str_9
	call	_Print
;repete.c:43: Print(meuEndereco.numero);
	ld	hl, #50
	add	hl, sp
	call	_Print
;repete.c:44: Print("\n");
	ld	hl, #___str_8
	call	_Print
;repete.c:45: Print("Cidade: ");
	ld	hl, #___str_10
	call	_Print
;repete.c:46: Print(meuEndereco.cidade);
	ld	hl, #60
	add	hl, sp
	call	_Print
;repete.c:47: Print("\n");
	ld	hl, #___str_8
	call	_Print
;repete.c:48: Print("Estado: ");
	ld	hl, #___str_11
	call	_Print
;repete.c:49: Print(meuEndereco.estado);
	ld	hl, #110
	add	hl, sp
	call	_Print
;repete.c:50: Print("\n");
	ld	hl, #___str_8
	call	_Print
;repete.c:51: Print("CEP: ");
	ld	hl, #___str_12
	call	_Print
;repete.c:52: Print(meuEndereco.cep);
	ld	hl, #113
	add	hl, sp
	call	_Print
;repete.c:53: Print("\n");
	ld	hl, #___str_8
	call	_Print
;repete.c:54: Print("==================================\n");
	ld	hl, #___str_6
	call	_Print
;repete.c:57: Print("\nPressione qualquer tecla...");
	ld	hl, #___str_13
	call	_Print
;repete.c:58: WaitKey();
	call	_WaitKey
;repete.c:59: }
	ld	sp, ix
	pop	ix
	ret
_Done_Version_tag:
	.ascii "Made with FUSION-C 1.3 R21010 (c)EBSOFT:2021"
	.db 0x00
___str_0:
	.ascii "Av. Paulista"
	.db 0x00
___str_1:
	.ascii "1578"
	.db 0x00
___str_2:
	.ascii "Sao Paulo"
	.db 0x00
___str_3:
	.ascii "SP"
	.db 0x00
___str_4:
	.ascii "01310-200"
	.db 0x00
___str_5:
	.ascii "Endereco"
	.db 0x0a
	.db 0x00
___str_6:
	.ascii "=================================="
	.db 0x0a
	.db 0x00
___str_7:
	.ascii "Rua: "
	.db 0x00
___str_8:
	.db 0x0a
	.db 0x00
___str_9:
	.ascii "Numero: "
	.db 0x00
___str_10:
	.ascii "Cidade: "
	.db 0x00
___str_11:
	.ascii "Estado: "
	.db 0x00
___str_12:
	.ascii "CEP: "
	.db 0x00
___str_13:
	.db 0x0a
	.ascii "Pressione qualquer tecla..."
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
