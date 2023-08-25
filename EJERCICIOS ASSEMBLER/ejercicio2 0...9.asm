.model small
.stack 64
.data
    msj DB 10,13, "Presione una tecla para continuar...$" 
    msjfinal DB 10,13, "Presione # para salir: $"
.code
    mov ax,@data
    mov ds,ax
    
    mov dx, offset msj
    mov ah,09h
    int 21h
    
    mov cx,9
    
    repeticion: 
        mov dl,cl    
        add dl,30h
        mov ah,02h
        int 21h 
        
        mov ah,00h
        int 16h    
        
    loop repeticion 
    
    mov dl,cl
    add dl,30h
    mov ah,02h
    int 21h
    
    esperar:
        mov dx,offset msjfinal
        mov ah,09h
        int 21h
        
        mov ah,01h
        int 21h  
        
        cmp al,35d
        je final
        jne esperar        
final:
    mov ah,4Ch
    int 21h
    
end