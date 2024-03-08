
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack
.data    ;declaramos las variables en data
    ;13,10 permite pasar el enter
    ;Se pone siempre al final $
    numero1 db 0
    numero2 db 0
    division db 0
    residuo db 0
    mensaje1 db 13,10, "Ingrese el primer numero: $"
    mensaje2 db 13,10, "Ingrese el segundo numero: $"
    mensaje3 db 13,10,13,10, "DIVISION= $"    
    mensaje4 db 13,10,13,10, "RESIDUO= $"
    mensaje5 db 13,10,13,10, "Alan Gerardo Garcia Cervantes $"
    
.code

    mov ax,@data    ;movemos la data a ax
    mov ds,ax       ;movemos los datos de ax a ds
       ;capturo primer numero
    mov ah,09h      
    lea dx,mensaje1 
    int 21h         
    
    mov ah,01h ;funcion para cursor en pantalla
    int 21h    
    
    
    sub al,30h   
    mov numero1,al  
    
    ;Capturo segundo numero
    
    mov ah,09h
    lea dx,mensaje2  ;Paso el contenido de una variable a dx para mostrar
    int 21h          ;ejecuto la funcion 09h de la interrupcion 21h
    
    mov ah,01h ;funcion para cursor en pantalla
    int 21h
    
    sub al,30h   
    mov numero2,al  
    
       
    
    mov ah,09h
    lea dx,mensaje3
    int 21h         ;ejecuto la funcion 09h de la interrupcion 21h  
    
    ;Division
    
    xor ax,ax
    mov al, numero1  
    mov bl, numero2
    div bl             ;division al= al / bl
    mov division,al 
    mov residuo,ah    ;mando el residuo de ah a la variable residuo
    
    ;mostrar division
    
    mov dl,division
    add dl,30h
    mov ah, 02h
    int 21h
    
    ;mostrar residuo
    
    mov ah,09h
    lea dx,mensaje4
    int 21h         ;ejecuto la funcion 09h de la interrupcion 21h  
    
    
    mov dl,residuo
    add dl,30h
    mov ah, 02h
    int 21h 
    
    ;nombre
    mov ah,09h
    lea dx,mensaje5
    int 21h
    
    
    mov ax,4c00h  ;Preparo la terminacion del proceso //son dos funciones juntas 4c-ah, 00-al. Suman 16bits osea ax
    int 21h

ret




