section .data
    msg1 db 'Ingrese el valor: $'
    msg2 db 0x0a, 'El resultado es: $'
    nums db 10 dup (0) ; arreglo para almacenar los números de la serie
    cr db 0x0a, 0x0d, '$' ; salto de línea y retorno de carro

section .text
global _start

_start:
    ; mostrar mensaje para ingresar el número
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 18
    int 0x80

    ; leer el número ingresado
    mov eax, 3
    mov ebx, 0
    mov edx, 1
    int 0x80
    sub al, 0x30 ; convertir de ASCII a número
    mov bl, al ; bl = número ingresado

    ; mostrar mensaje para el resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 20
    int 0x80

    ; imprimir la serie de números
    mov cx, 1 ; inicializar el contador
    xor esi, esi ; inicializar el índice del arreglo
print_loop:
    mov ax, cx ; guardar el número actual en ax
    add ax, 0x30 ; convertir de número a ASCII
    mov byte [nums + esi], al ; almacenar en el arreglo
    inc esi ; incrementar el índice del arreglo

    ; imprimir los números almacenados en el arreglo
    mov eax, 4
    mov ebx, 1
    mov ecx, nums
    mov edx, esi
    int 0x80

    ; imprimir un salto de línea y un retorno de carro
    mov eax, 4
    mov ebx, 1
    mov ecx, cr
    mov edx, 2
    int 0x80

    ; incrementar el contador y verificar si se ha alcanzado el número ingresado
    inc cx
    cmp cx, bx
    jle print_loop

    ; terminar el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
