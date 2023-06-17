segment .data
    arre db  0, 0, 0, 0 ; se almacenan los valores dentro
                      ; del rango del 0 a 9 para
                      ; evitar imprimir símbolos
    len equ $-arre
   
    msg1 db "Ingrese un numero y presione enter, cuatro veces:", 0xA
    len1 equ $-msg1
   
    msg2 db "Los elementos ingresados y almacenados en el arreglo son:", 0xA
    lenmsg2 equ $-msg2
   
    comspace db "  ",
    lencomspace equ $-comspace
   
    ln db 10,13
    lenln equ $-ln

segment .bss
    dato resb 2 ; reservamos dos bytes debido a que al leer un dato
                ; del teclado se almacenará también el enter (\n) o
                ; salto de línea

segment .text
    global _start
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 0x80

    mov esi, arre ; colocamos la dirección de memoria en el registro
               ; esi esto para mejorar la velocidad del programa
    mov edi, 0 ; colocamos el número cero en el registro edi
               ; que nos servirá de contador

    xor eax, eax ; inicializamos el acumulador a cero

ciclo_lectura:
    mov eax, 3 ; leemos datos de un dispositivo
    mov ebx, 0 ; especifiamos que el dispositivo es el teclado
    mov ecx, dato ; dirección de memoria donde almacenarán los
                 ; caracteres leídos
    mov edx, 2 ; leemos dos bytes del teclado, el dato y el salto de
               ; línea (\n)
    int 0x80

    mov al, [dato] ; accedemos al dato introducido desde el teclado y
                   ; lo guardamos en el registro al
    sub al, '0' ; ya que el caracter lo deseamos pasar a su valor
                 ; numérico le restamos 30h, 48 o el caracter '0'
    mov [esi+edi], al ;colocamos el dato dentro del arreglo en la
                      ;posición edi (0,1,2,....) en bytes

    add eax, edi ; sumamos el valor actual al acumulador
    add edi, 1 ; incrementamos edi en uno
    cmp edi, len ; preguntamos si ya hemos leído todos los
                ; números del arreglo
    jb ciclo_lectura ; si aun faltan datos por leer, volvemos al ciclo
                     ; de nuevo y en caso contrario, dejamos
                     ; de leer del teclado

    mov edi, 0 ; colocamos el número cero en el registro edi
               ; que nos servirá de contador
   
    mov eax, 4
    mov ebx, 1
    mov ecx, ln
    mov edx, lenln
    int 0x80
   
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, lenmsg2
    int 0x80
   

ciclo_impresion:
    mov

