section .data
    mensaje db 'Introduce un número par: ', 0
    lon_mensaje equ $-mensaje
    
    error db 'Error: el número introducido no es par', 0
    lon_error equ $-error
    
    mensaje2 db 'Introduce un número para sumar: ', 0
    lon_mensaje2 equ $-mensaje2
    
    resultado db 'El resultado de la suma es: ', 0
    lon_resultado equ $-resultado
    
section .bss
    num resw 1
    suma resw 1
    
section .text
    global _start
    
_start:
    ; Imprimimos el mensaje para pedir el número par
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, lon_mensaje
    int 80h
    
    ; Leemos el número par introducido
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 2
    int 80h
    
    ; Comprobamos que el número es par
    mov ax, [num]
    and ax, 1
    jnz error_input  ; Si el bit menos significativo es 1, el número es impar
    
    ; Imprimimos el mensaje para pedir el número para sumar
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje2
    mov edx, lon_mensaje2
    int 80h
    
    ; Leemos el número para sumar introducido
    mov eax, 3
    mov ebx, 0
    mov ecx, suma
    mov edx, 2
    int 80h
    
    ; Inicializamos el contador y el acumulador
    mov ax, [num]
    mov bx, 0
    
    ; Empezamos el bucle de suma
    loop_suma:
        ; Si ya hemos llegado al número deseado, salimos del bucle
        cmp ax, bx
        je imprimir_resultado
        
        ; Sumamos el valor actual al acumulador
        add bx, ax
        
        ; Incrementamos el contador
        add ax, 2
        
        ; Volvemos al inicio del bucle
        jmp loop_suma
        
    ; Imprimimos el resultado final
    imprimir_resultado:
        mov eax, 4
        mov ebx, 1
        mov ecx, resultado
        mov edx, lon_resultado
        int 80h
        
        mov eax, 4
        mov ebx, 1
        mov ecx, suma
        mov edx, 2
        int 80h
        
    ; Salimos del programa
    mov eax, 1
    xor ebx, ebx
    int 80h
    
error_input:
    ; Si el número introducido no es par, mostramos un mensaje de error y salimos del programa
    mov eax, 4
    mov ebx, 1
    mov ecx, error
    mov edx, lon_error
    int 80h
    
    mov eax, 1
    xor ebx, ebx
    int 80h
