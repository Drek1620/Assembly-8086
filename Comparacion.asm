
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small 
.stack
.data
    numero1 db 8
    numero2 db 9
    mensaje1 db 13,10,"NUMEROS IGUALES $"
    mensaje2 db 13,10,"NUMERO 1 MAYOR $"
    mensaje3 db 13,10,"NUMERO 2 MAYOR $"
.code
    ;Comparaciones
    ;Si los numeros son iguales ZF=1 CF=0
    ;Si segundo nuemero es mayor ZF=0 CF=1
    ;Si primer nuemro es mayor ZF=0 CF=0
    
    
    inicio:
    mov ax,@data
    mov ds,ax
    
    mov ah,numero1
    cmp ah,numero2
    
    jc MayorNum2
    jz Iguales
    jnz MayorNum1
    
Iguales:
    mov ah,09h
    lea dx,mensaje1
    int 21h
.exit

MayorNum1:
    mov ah,09h
    lea dx,mensaje2
    int 21h
.exit

MayorNum2:
    mov ah,09h
    lea dx,mensaje3
    int 21h
.exit
    

ret




