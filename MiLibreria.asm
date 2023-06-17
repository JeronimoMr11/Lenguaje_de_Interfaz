; Archivo pruebaLibreria.asm%include "MiLibreria.lib"
 %include "MiLibreria.lib"


section .data
    msg1 db "mensaje1", 0xA, 0xD
    len1 equ $-msg1
   
    msg2 db "mensaje2", 0xA, 0xD
    len2 equ $-msg2

section .text
    global _start
   
_start:
    imprime msg1, len1
    imprime msg2, len2


; Codigo de salida
salir:
    mov eax,1
    mov ebx,0
    int 80h
    ;int 0x80
