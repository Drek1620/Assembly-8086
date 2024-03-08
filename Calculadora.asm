
org 100h

.model small 
.stack
.data
    opcion db 8
    opcion1 db 1
    opcion2 db 2
    opcion3 db 3
    opcion4 db 4
    opcion5 db 5
    n1 db 0
    n2 db 0 
    resultado db 0 
    residuo db 0                                   
    error db 13,10,13,10, "ERROR!! SELECCIONE UNA OPCION VALIDA $" 
    salida db 13,10,13,10, "SALIENDO!!!!!! $" 
    menos db "-$"
    
    m0  db 13,10,   "   лллллллллллллллллллллллллллллллллллллл $"
    m1  db 13,10,   "   лл              MENU                лл $"
    m2  db 13,10,   "   лл                                  лл $"
    m3  db 13,10,   "   лл   1.SUMA                         лл $"
    m4  db 13,10,   "   лл   2.RESTA                        лл $"
    m5  db 13,10,   "   лл   3.MULTIPLICACION               лл $"
    m6  db 13,10,   "   лл   4.DIVISION                     лл $"
    m7  db 13,10,   "   лл   5.SALIR                        лл $"
    m8  db 13,10,   "   лл                                  лл $"
    m9  db 13,10,   "   лллллллллллллллллллллллллллллллллллллл $" 
    
    m10 db 13,10,13,10, "SELECCIONE UNA OPCION: $"
    m11 db 13,10,13,10,"   лллллллллллллллллллллллллллллллллллллл $"
    m12 db 13,10,      "   л         SUMA DE OPERACIONES        л $"
    m13 db 13,10,      "   лллллллллллллллллллллллллллллллллллллл $"
    m14 db 13,10,      "   л         RESTA DE OPERACIONES       л $"
    m15 db 13,10,      "   л    MULTIPLICACION DE OPERACIONES   л $"
    m16 db 13,10,      "   л       DIVISION DE OPERACIONES      л $"
                                                                                                        
                                                                                                        
    m17 db 13,10,13,10,"INGRESE EL PRIMER NUMERO: $"
    m18 db 13,10,"INGRESE EL SEGUNDO NUMERO: $"
    m19 db 13,10,13,10,"RESULTADO: $" 
    m20 db 13,10,13,10,"RESIDUO: $" 
    m21  db 13,10,   "   лл**Alan Gerardo Garcia Cervantes***лл $"
.code
    ;Comparaciones
    ;Si los numeros son iguales ZF=1 CF=0
    ;Si segundo nuemero es mayor ZF=0 CF=1
    ;Si primer nuemro es mayor ZF=0 CF=0
    
    
Inicio:    ; se muestra el menu
    mov ax,@data
    mov ds,ax
     
    mov ah,09h
    lea dx,m0
    int 21h
      
    ;Nombre
    mov ah,09h
    lea dx,m21
    int 21h
    
    mov ah,09h
    lea dx,m1
    int 21h 
    
    
    mov ah,09h
    lea dx,m2
    int 21h
    
    mov ah,09h
    lea dx,m3
    int 21h
    
    mov ah,09h
    lea dx,m4
    int 21h
    
    mov ah,09h
    lea dx,m5
    int 21h
    
    mov ah,09h
    lea dx,m6
    int 21h
    
    mov ah,09h
    lea dx,m7
    int 21h
    
    mov ah,09h
    lea dx,m8
    int 21h
    
    mov ah,09h
    lea dx,m9
    int 21h 
     
    


Comparacion:  ;se selecciona una opcion y se manda a 
              ; la operacion seleccionada
     
    mov ah,09h
    lea dx,m10    ;mensaje de seleccionar una opcion
    int 21h
     
    
    mov ah,01h
    int 21h
    
    xor ah,ah
    sub al,30h
    mov opcion,al
                  
    mov ah,opcion
    cmp ah,opcion1
    
    jz Suma
    
    cmp ah,opcion2
    jz Resta
    
    cmp ah,opcion3
    
    jz Multiplicacion
    
    cmp ah, opcion4
    jz Division
    
    cmp ah,opcion5
    jz Salir
    
    
    mov ah,09h
    lea dx,error
    int 21h
    
    jmp Comparacion
   
    
Suma:  ;Si la operacion seleccionada es suma
    mov ah,09h
    lea dx,m11
    int 21h
    
    mov ah,09h
    lea dx,m12
    int 21h
    
    mov ah,09h
    lea dx,m13
    int 21h
    
    mov ah,09h
    lea dx,m17
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov n1,al
    
    mov ah,09h
    lea dx,m18
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov n2,al
    
    ;suma
    
    mov al,n1
    add al,n2
    mov resultado,al 
    
    mov ah,09h
    lea dx,m19
    int 21h
    
    mov dl,resultado
    add dl,30h
    mov ah,02h
    int 21h
    
    jmp Comparacion
    
.exit

Resta:   ;Si la operacion seleccionada es resta
    mov ah,09h
    lea dx,m11
    int 21h
    
    mov ah,09h
    lea dx,m14
    int 21h
    
    mov ah,09h
    lea dx,m13
    int 21h
    
    mov ah,09h
    lea dx,m17
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov n1,al
    
    mov ah,09h
    lea dx,m18
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov n2,al
    
    ;resta
    mov ah,n1
    cmp ah,n2     ;Compara cual numero es mayor
    
    jc Acarreo    ;Si el segundo numero es mayor se manda a imprimir negativo
     
    mov al,n1
    sub al,n2           ;Si es resta positiva se imprime normal
    mov resultado,al
    
    mov ah,09h
    lea dx,m19
    int 21h
    
    mov dl,resultado
    add dl,30h
    mov ah,02h
    int 21h 
    
    jmp Comparacion
    
.exit

Acarreo:     ;Etiqueta en caso de que la resta sea negativa
    mov al,n2            ;Resta al reves para obtener un resultado
    sub al,n1
    mov resultado,al
    
    mov ah,09h
    lea dx,m19      ;mensaje "Resta"
    int 21h
    
    mov ah,09h
    lea dx,menos    ;Mensaje de "-"
    int 21h
    
    mov dl,resultado
    add dl,30h         ;Imprime el resultado de la resta
    mov ah,02h
    int 21h 
    
    jmp Comparacion    ;Se devuelve a la comparacion

Division:   ;Si la operacion seleccionada es division
    mov ah,09h
    lea dx,m11
    int 21h
    
    mov ah,09h
    lea dx,m16
    int 21h
    
    mov ah,09h
    lea dx,m13
    int 21h
    
    mov ah,09h
    lea dx,m17
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov n1,al
    
    mov ah,09h
    lea dx,m18
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov n2,al
    
    ;DIVISION     
    mov ah,09h
    lea dx,m19
    int 21h
      
    xor ax,ax
    mov al,n1
    mov dl,n2
    div dl
    mov resultado,al
    mov residuo,ah
    
    mov dl,resultado
    add dl,30h
    mov ah,02h
    int 21h
    
    mov ah,09h
    lea dx,m20
    int 21h
    
    mov dl,residuo
    add dl,30h
    mov ah,02h
    int 21h
      
    jmp Comparacion
    
.exit

Multiplicacion: 
    mov ah,09h
    lea dx,m11
    int 21h
    
    mov ah,09h
    lea dx,m15
    int 21h
    
    mov ah,09h
    lea dx,m13
    int 21h
    
    mov ah,09h
    lea dx,m17
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov n1,al
    
    mov ah,09h
    lea dx,m18
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov n2,al  
    ;
    ;Multiplicacion 
    
    mov ah,09h
    lea dx,m19
    int 21h
    
    mov al,n1
    mov bl,n2
    mul bl
    mov resultado,al   
    
    mov dl,resultado
    add dl,30h
    mov ah,02h
    int 21h
           
    jmp Comparacion
    
.exit

Salir:  ;Si la seleccion fue salir
    mov ah,09h 
    lea dx,salida
    int 21h
    
    mov ax,4c00h
    int 21h   
    

ret




