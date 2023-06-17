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
    
    ; Inicia el ciclo for
    mov ecx, 9    ; Inicializa el contador en 9
    mov ebx, 1    ; Inicializa el incremento en 1
    mov eax, num  ; Carga el valor inicial
    
    for_loop:
        ; Imprime el valor actual
        mov eax, 4
        mov ebx, 1
        mov ecx, num
        mov edx, 1
        int 0x80
        
        ; Incrementa el valor actual
        inc byte [num]
        
        ; Verifica si el contador llegó a 0
        jz end_loop
        
        ; Decrementa el contador
        dec ecx
        
        ; Salta al inicio del ciclo
        jmp for_loop
    
    end_loop:
    ; Termina el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
