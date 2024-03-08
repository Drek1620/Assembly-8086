
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack
.data    ;declaramos las variables
    numero1 db 0
    numero2 db 0
    resta db 0
    mensaje1 db 13,10, "Ingrese el primer numero: $"
    mensaje2 db 13,10, "Ingrese el segundo numero: $"
    mensaje3 db 13,10, "SUMA= $"
    mensaje4 db 13,10, "Alan Gerardo Garcia Cervantes $"
    
.code

    mov ax,@data    ;movemos la data a ax
    mov ds,ax       ;movemos los datos de ax a ds
    
    mov ah,09h
    lea dx,mensaje1
    int 21h
    
    mov ah,01h ;funcion para cursor en pantalla
    int 21h
    
    sub al,30h   ;resto 30h a al
    mov numero1,al ;guardo el resultado en la variable
    
    mov ah,09h
    lea dx,mensaje2
    int 21h
    
    mov ah,01h ;funcion para cursor en pantalla
    int 21h
    
    sub al,30h   ;resto 30h a al
    mov numero2,al
    
    mov al, numero1
    sub al, numero2   ;sumo numero2 al contenido de al
    mov resta,al    ;direcciono el contenido de al a la variable suma
    
    mov ah,09h
    lea dx,mensaje3
    int 21h
    
    ;resta
    
    mov dl,resta
    add dl,30h
    mov ah, 02h
    int 21h 
    
    ;nombre
    mov ah,09h
    lea dx,mensaje4
    int 21h
    
    
    mov ax,4c00h  ;Preparo la terminacion del proceso
    int 21h

ret




