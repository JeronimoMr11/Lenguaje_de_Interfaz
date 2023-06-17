;ISC
;Lenguajes_de_interfaz
;6°
;2_Unidad
;Jesus_Ramiro_Jeronimo_Morales

section .data
    mensaje1 db 'Ingresa el primer número: '
    mensaje2 db 'Ingresa el segundo número: '
    mensaje3 db 'La suma es: '
    mensaje4 db 'La resta es: '
    mensaje5 db 'La división es: '
    divisor_error db 'Error: No se puede dividir por cero.'

section .bss
    num1 resd 1
    num2 resd 1
    resultado resd 1

section .text
    global _start

_start:
    ; Imprimir mensaje1 y leer num1
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje1
    mov edx, 23
    int 0x80
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; Imprimir mensaje2 y leer num2
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje2
    mov edx, 24
    int 0x80
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; Suma
    mov eax, [num1]
    add eax, [num2]
    mov [resultado], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje3
    mov edx, 14
    int 0x80
    mov eax, 1
    mov ebx, 0
    mov ecx, [resultado]
    mov edx, 4
    int 0x80

    ; Resta
    mov eax, [num1]
    sub eax, [num2]
    mov [resultado], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje4
    mov edx, 14
    int 0x80
    mov eax, 1
    mov ebx, 0
    mov ecx, [resultado]
    mov edx, 4
    int 0x80

    ; División
    mov eax, [num1]
    cdq
    idiv dword [num2]
    cmp dword [num2], 0
    je error_division
    mov [resultado], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje5
    mov edx, 15
    int 0x80
    mov eax, 1
    mov ebx, 0
    mov ecx, [resultado]
    mov edx, 4
    int 0x80

    ; Salida del programa
    mov eax, 1
    mov ebx, 0
    int 0x80

error_division:
    ; Manejo del error de división por cero
    mov eax, 4
    mov ebx, 1
    mov ecx, divisor_error
    mov edx, 29
    int 0x80
    ; Salida del programa con error
