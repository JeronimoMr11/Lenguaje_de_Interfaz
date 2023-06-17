;ISC
;Lenguajes_de_interfaz
;6°
;2_Unidad
;Jesus_Ramiro_Jeronimo_Morales

Usermsg1 db 'Ingrese numero: ', 0xA,0xD

even db "Es par", 0xA,0xD

odd db "Es impar", 0xA,0xD

section .bss
num resb 1

section .text
global _start

_start:
    ; muestra el mensaje para ingresar un numero
    mov eax, 4
    mov ebx, 1
    mov ecx, Usermsg1
    mov edx, 16
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

    ; verifica la paridad del numero
    test al, 1
    jz even_num
    
    
    
    ; el numero es impar
    mov eax, 4
    mov ebx, 1
    mov ecx, odd
    mov edx, 8
    int 0x80
    jmp end_prog

even_num:
    ; el numero es par
    
    mov eax, 4
    mov ebx, 1
    mov ecx, even
    mov edx, 6
    int 0x80

end_prog:
    ; termina el programa
    
    mov eax, 1
    xor ebx, ebx
    int 0x80
