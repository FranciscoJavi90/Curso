.model small                  ; Define el modelo de memoria como small
.stack 64                     ; Define el tamaño de la pila en 64 bytes
.data                         ; Segmento de datos
    num1 db 0                 ; Variable para almacenar el primer numero ingresado
    num2 db 0                 ; Variable para almacenar el segundo numero ingresado
    num3 db 0                 ; Variable para almacenar el resultado de la suma
    pedir1 db "Ingrese un numero: $" ; Mensaje para solicitar el primer numero
    pedir2 db 10,13,13,"Ingrese otro numero: $" ; Mensaje para solicitar el segundo numero
    result db 10,10,13,"La suma de los numeros es: $" ; Mensaje para mostrar el resultado de la suma
.code                         ; Segmento de codigo
    mov ax, @data             ; Carga la direccion del segmento de datos en AX
    mov ds, ax                ; Mueve la direccion de segmento a DS, apuntando al segmento de datos
    
    mov dx, offset pedir1     ; Carga la direccion del mensaje para el primer numero en DX
    mov ah, 09h               ; Establece el servicio de impresion de cadena en 09h (interrupcion 21h)
    int 21h                   ; Llama a la interrupcion 21h para imprimir el mensaje
    
    mov ah, 01h               ; Establece el servicio de entrada de caracter en 01h (interrupcion 21h)
    int 21h                   ; Lee un caracter desde la entrada estandar
    sub al, 30h               ; Convierte el caracter ASCII a su valor numerico y lo guarda en AL
    mov num1, al              ; Guarda el valor numerico ingresado en la variable num1
    
    mov dx, offset pedir2     ; Carga la direccion del mensaje para el segundo numero en DX
    mov ah, 09h               ; Establece el servicio de impresion de cadena en 09h (interrupcion 21h)
    int 21h                   ; Llama a la interrupcion 21h para imprimir el mensaje
    
    mov ah, 01h               ; Establece el servicio de entrada de caracter en 01h (interrupcion 21h)
    int 21h                   ; Lee un caracter desde la entrada estandar
    sub al, 30h               ; Convierte el caracter ASCII a su valor numerico y lo guarda en AL
    mov num2, al              ; Guarda el valor numerico ingresado en la variable num2
    
    mov al, num1              ; Mueve el contenido de num1 a AL
    add al, num2              ; Suma el contenido de num2 a AL
    mov num3, al              ; Guarda el resultado de la suma en la variable num3
    
    mov dx, offset result     ; Carga la direccion del mensaje de resultado en DX
    mov ah, 09h               ; Establece el servicio de impresion de cadena en 09h (interrupcion 21h)
    int 21h                   ; Llama a la interrupcion 21h para imprimir el mensaje
    
    mov dl, num3              ; Mueve el contenido de num3 a DL para imprimirlo
    add dl, 30h               ; Convierte el valor numérico de DL a su representacion ASCII
    mov ah, 02h               ; Establece el servicio de impresion de caracter en 02h (interrupcion 21h)
    int 21h                   ; Llama a la interrupcion 21h para imprimir el resultado
    
    mov ah, 4ch               ; Establece el servicio de terminacion del programa en 4Ch (interrupcion 21h)
    int 21h                   ; Llama a la interrupcion 21h para terminar el programa
end                          ; Fin del programa
