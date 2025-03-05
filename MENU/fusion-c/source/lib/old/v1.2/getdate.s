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
;
;	getdate 
;	Definitions for dealing with MSXDOS
;
;	(C) 1995, SOLID MSX C
;
;	SDCC port 2015
;
	.area _CODE

;--- proc 	getdate
;
;	void	GetDate(DATE *date);
;
_GetDate::
	push ix
	ld ix,#0
	add ix,sp
	ld l,4(ix)
	ld h,5(ix)
	
	push	hl
	xor	a
	ld	b,#8
lb_gtdtLp:
	ld	(hl),a
	inc	hl
	djnz	lb_gtdtLp
	
	ld	c,#0x2A
	call	#5
	
	pop	ix
	ld	0(ix),l
	ld	1(ix),h
	ld	2(ix),d
	ld	4(ix),e
	ld	6(ix),a
	pop	ix
	ret
;--- end of proc
