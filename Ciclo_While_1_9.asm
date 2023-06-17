section .data
    msg db 'Los numeros del 1 al 9 son: ', 0xA, 0xD
    num db 1

section .text
global _start

_start:
    ; Imprime el mensaje
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 28
    int 0x80
    
    ; Inicializa el valor inicial y el contador
    mov eax, num
    mov ebx, 9
    
    while_loop:
        ; Imprime el valor actual
        mov eax, 4
        mov ebx, 1
        mov ecx, num
        mov edx, 1
        int 0x80
        
        ; Incrementa el valor actual
        inc byte [num]
        
        ; Decrementa el contador
        dec ebx
        
        ; Verifica si el contador llega a 0
        jz end_loop
        
        ; Vuelve al inicio del ciclo while
        jmp while_loop
    
    end_loop:
    ; Termina el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

