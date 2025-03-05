; ___________________________________________________________
;/               __           _                              \
;|              / _|         (_)                             |
;|             | |_ _   _ ___ _  ___  _ __                   |
;|             |  _| | | / __| |/ _ \| '_ \                  |
;|             | | | |_| \__ \ | (_) | | | |                 |
;|             |_|  \__,_|___/_|\___/|_| |_| *               |
;|                                                           |
;|               The MSX C Library for SDCC                  |
;|                   V1.0 - 09-10-11 2018                    |
;|                                                           |
;|                Eric Boez &  Fernando Garcia               |
;|                                                           |
;|               A S M  S O U R C E   C O D E                |
;|                                                           |
;|                                                           |
;\___________________________________________________________/
;
; Call DOS functions
; 1995, SOLID MSX C & SDCC port 2015
; 2019-2020 Eric Boez
;
;
;	GetTime


;----------------------------
;   MODULE  GetTime
;   
;	void	GetTime(TIME *time);
;	Return MSX-DOS Time to Structure address
;
;
;	
 .area _CODE
 
 
_GetTime::
	push ix
	ld ix,#0
	add ix,sp
	ld l,4(ix)
	ld h,5(ix)
	
	push	hl
	xor	a
	ld	b,#6
lb_gttmLp:
	ld	(hl),a
	inc	hl
	djnz	lb_gttmLp
	
	ld	c,#0x2C
	call	#5
	pop	ix
	ld	0(ix),h
	ld	2(ix),l
	ld	4(ix),d
	pop	ix
	ret
