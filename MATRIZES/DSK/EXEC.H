/*
 *	Definitions of the EXEC format
 */

#define	EXITIT	0x80
#define	EXEC	0x81
#define	IGN_ERR	0x82
#define	DEF_ERR	0x83
#define	SKP_ERR	0x84
#define	TRAP	0x85
#define	IF_ERR	0x86
#define	IF_NERR	0x87
#define	ECHO	0x88
#define	PRINT	0x89
#define	RM_FILE	0x8A
#define	RM_EXIT	0x8B
#define keybuf 0xfbf0				/* MSX */
#define putpnt (*(unsigned int *)0xf3f8)	/* MSX */
#define getpnt (*(unsigned int *)0xf3fa)	/* MSX */

                                                                        