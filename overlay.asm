.list

#include     ../bios.inc
#include     ../kernel.inc
#include     ../macros.inc

             org     02000h

             extrn   overinit

begin:       br      start
             eever
             db      'Written by Michael H. Riley',0

start:       mov     rd,ocb            ; point to overlay control block
             call    o_overinit        ; initialize overlays
             mov     rf,o1
             mov     rd,ocb
             call    o_loadover
             lbdf    error
             call    04000h
             mov     rf,o2
             mov     rd,ocb
             call    o_loadover
             lbdf    error
             call    04000h
             rtn

error:       call    o_inmsg
             db      'Error loading overlay',10,13,0
             rtn

ocb:         db      0                 ; flags
             dw      04000h            ; where overlays will load
             dw      names             ; pointer to name table
             dw      2                 ; 2 overlays
             dw      0,0               ; sector
             db      0                 ; overlay sector number for entry 1
             dw      2                 ; sector for entry 1
             db      1                 ; load 1 sector
             dw      0,0               ; sector
             db      0                 ; overlay sector number for entry 2
             dw      3                 ; sector for entry 2
             db      1                 ; load 1 sector

names:       db      'over','1'+080h
             db      'over','2'+080h
             db      0

o1:          db      'over1',0
o2:          db      'over2',0

             end     begin

             
