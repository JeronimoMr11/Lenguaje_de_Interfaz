;arbol
section .data
    prompt db 'Ingrese un número: '
    newline db 10
    space db ' '
 
section .bss
    num resb 1
 
section .text
    global _start
 
print_num:
    mov eax, [ebp+8]
    mov ebx, 10
    xor ecx, ecx
 
digit_loop:
    xor edx, edx
    div ebx
    push dx
    inc cl
    cmp eax, 0
    jne digit_loop
 
print_loop:
    pop eax
    add eax, '0'
    mov [esp], al
    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 1
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80
    dec cl
    cmp cl, 0
    jne print_loop
    ret
 
_start:
    ; print prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 18
    int 0x80
 
    ; read num
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 1
    int 0x80
 
    ; convert num to int
    sub byte [num], '0'
 
    ; call print_num
    push byte [num]
    call print_num
 
    ; newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
 
    ; print tree
    mov eax, [num]
    mov ebx, 2
    call print_tree
 
    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
 
print_tree:
    cmp eax, 1
    je print_one
 
    ; print left subtree
    push eax
    sub eax, 1
    shr eax, 1
    call print_tree
    add esp, 4
 
print_one:
    ; print node value
    push eax
    call print_num
    add esp, 4
 
    ; print right subtree
    cmp ebx, 0
    je done
    push eax
    shr eax, 1
    call print_tree
    add esp, 4
    ret
 
done:
    ret
