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
    mov edx, 27
    int 0x80
    
    ; Inicializa el valor inicial
    mov eax, num
    
    ; Inicializa el contador
    mov ebx, 9
    
    ; Ciclo do-while
    do_while_loop:
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
        
        ; Verifica si el contador es distinto de cero
        jnz do_while_loop
    
    ; Termina el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
