.model small
.stack 64
.data
    msj DB 10,13, "Presione 0 para escribir el abecedario en mayusculas, 1 para escribirlo en minusculas, 2 para mostrar los 10 digitos, 3 abecedario invertido: $" 
    msjfinal DB 10,13, "Presione # para salir: $" 
    msg_digitos DB 10,13, "Los digitos: $"
    msg_invertido DB 10,13, "Abecedario invertido: $"
    msg_minusculas DB 10,13, "Estas son las letras en minuscula: $"
    msg_mayusculas DB 10,13, "Estas son las letras en mayuscula: $"
.code
    mov ax, @data
    mov ds, ax

main_loop:
    mov dx, offset msj
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    cmp al, 0
    je mayusculas
    cmp al, 1
    je minusculas 
    cmp al, 2
    je digitos
    cmp al, 3
    je invertido
    mov dx, offset msj
    mov ah, 09h
    int 21h
    jmp main_loop

mayusculas:
    mov dx, offset msg_mayusculas
    mov ah, 09h
    int 21h

    mov cl, 'A'

escribir_mayusculas:
    mov dl, cl
    mov ah, 02h
    int 21h

    inc cl
    cmp cl, 'Z'
    jbe escribir_mayusculas
    jmp main_loop

minusculas:
    mov dx, offset msg_minusculas
    mov ah, 09h
    int 21h

    mov cl, 'a'

escribir_minusculas:
    mov dl, cl
    mov ah, 02h
    int 21h

    inc cl
    cmp cl, 'z'
    jbe escribir_minusculas
    jmp main_loop

digitos: 
    mov dx, offset msg_digitos
    mov ah, 09h
    int 21h

    mov cl, '0'

escribir_digitos:
    mov dl, cl
    mov ah, 02h
    int 21h

    inc cl
    cmp cl, '9'
    jbe escribir_digitos
    jmp main_loop

invertido:  
    mov dx, offset msg_invertido
    mov ah, 09h
    int 21h

    mov cl, 'Z'

escribir_abecedario_invertido:
    mov dl, cl
    mov ah, 02h
    int 21h

    dec cl
    cmp cl, 'A'
    jae escribir_abecedario_invertido
    jmp main_loop

esperar_tecla:
    mov ah, 01h
    int 21h

    cmp al, '#'
    jne esperar_tecla

    mov ah, 4Ch
    int 21h
end
