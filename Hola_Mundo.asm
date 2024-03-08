
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack
.data
    ;Declaramos variables
    mensaje db "Hola mundo!","$"
    mensaje2 db 10,13,"Alan Gerardo Garcia Cervantes","$"
.code
    
    mov ax,@data ;mover el contenido de data al registro ax
    mov ds,ax ;mover el contenido de ax al segmento de datos ds
    
    mov ah,09h ;manda llamar la funcion 09h de 21h
    lea dx,mensaje ;muestra mensaje mensaje
    int 21h ;Interrupcion 21h
    
    mov ah,09h ;manda llamar la funcion 09h de 21h
    lea dx,mensaje2 ;muestra mensaje mensaje
    int 21h ;Interrupcion 21h 
    
    mov ax, 4c00h   ;Function (salir del codigo)
    int 21h

ret




