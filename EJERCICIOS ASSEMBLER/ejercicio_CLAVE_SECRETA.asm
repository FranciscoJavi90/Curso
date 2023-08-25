.model small
.stack 64
.data
    msg_clave_encontrada DB 10,13, "FELICITACIONES, CLAVE ENCONTRADA$"
    msg_intente_de_nuevo DB 10,13, "INTENTE DE NUEVO$"
    msg_ingresar_clave DB 10,13, "Ingrese la clave: $"
    caracter_especifico DB '/'
.code
    mov ax, @data
    mov ds, ax

preguntar_clave:
    mov dx, offset msg_ingresar_clave
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h

    cmp al, caracter_especifico
    je clave_encontrada
    jmp clave_incorrecta

clave_incorrecta:
    mov dx, offset msg_intente_de_nuevo
    mov ah, 09h
    int 21h
    jmp preguntar_clave

clave_encontrada:
    mov dx, offset msg_clave_encontrada
    mov ah, 09h
    int 21h

salir:
end
