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
;	SetTime


;----------------------------
;   MODULE  SetTime
;   
;	void	SetTime(TIME *time);
;	Set MSX-DOS Time from Structure address
;
;
;
 .area _CODE
 
 
_SetTime::
	push	ix
	ld ix,#0
	add ix,sp
	ld	h,4(ix)
	ld	l,6(ix)
	ld	d,8(ix)
	ld	e,#0
	ld	c,#0x2D
	call	#5
	pop	ix
	ld	l,a
	ld	h,#0
	ret