section .data
Usermsg1 db 'Ingrese un numero: ', 0xA,0xD
positive db 'El numero es positivo ', 0xA,0xD
negative db 'El numero es negativo ', 0xA,0xD

section .bss
num resb 1

section .text
global _start

_start:
    ; muestra el mensaje para ingresar un numero
    mov eax, 4
    mov ebx, 1
    mov ecx, Usermsg1
    mov edx, 21
    int 0x80

    ; lee el numero ingresado por el usuario
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 2
    int 0x80

    ; convierte el numero de ASCII a binario
    mov eax, 0
    mov al, [num]
    sub eax, '0'

    ; verifica si el numero es positivo o negativo
    cmp eax, 0
    jge positive_num
    
    ; el numero es negativo
    mov eax, 4
    mov ebx, 1
    mov ecx, negative
    mov edx, 23
    int 0x80
    jmp end_prog

positive_num:
    ; el numero es positivo
    
    mov eax, 4
    mov ebx, 1
    mov ecx, positive
    mov edx, 23
    int 0x80

end_prog:
    ; termina el programa
    
    mov eax, 1
    xor ebx, ebx
    int 0x80
