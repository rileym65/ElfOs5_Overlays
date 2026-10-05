.list

#include     ../bios.inc
#include     ../macros.inc

             org     04000h
over1:       call    f_inmsg
             db      'Hello from overlay 1',10,13,0
             rtn

