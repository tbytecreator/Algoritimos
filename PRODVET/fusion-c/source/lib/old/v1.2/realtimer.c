/*
 ___________________________________________________________
/               __           _                              \
|              / _|         (_)                             |
|             | |_ _   _ ___ _  ___  _ __                   |
|             |  _| | | / __| |/ _ \| '_ \                  |
|             | | | |_| \__ \ | (_) | | | |                 |
|             |_|  \__,_|___/_|\___/|_| |_| *               |
|                                                           |
|               The MSX C Library for SDCC                  |
|                       V1.0a - 02 2019                     |
|                                                           |
|                Eric Boez &  Fernando Garcia               |
|                                                           |
|                  C   S O U R C E   C O D E                |
|         compilation : > sdcc -mz80 -c  msx_misc.c         |
|                                                           |
\___________________________________________________________/
*/
/*  RealTimer
|    
|     2019 Eric Boez
*/
#include "../../header/msx_fusion.h"

// Return Real Timer value
unsigned int RealTimer(void)
{
    return(Peekw(0xFC9E));
}
