org 100h

.model small
.stack
.data
    opcion db 0
    opcion1 db 1
    opcion2 db 2
    opcion3 db 3
    n1 db 0
    n2 db 0
    n3 db 0
    n4 db 0
    np db 0 
    error db 13,10,13,10, "ERROR!! SELECCIONE UNA OPCION VALIDA $" 
    salida db 13,10,13,10, "SALIENDO!!!!!! $"
    
    m0  db 13,10,   "   лллллллллллллллллллллллллллллллллллллл $"
    m1  db 13,10,   "   лл              MENU                лл $"
    m2  db 13,10,   "   лл                                  лл $"
    m3  db 13,10,   "   лл   1.ORDENAR 3 NUMEROS            лл $"
    m4  db 13,10,   "   лл   2.ORDENAR 4 NUMEROS            лл $"
    m5  db 13,10,   "   лл   3.SALIR                        лл $"   
    
    m6 db 13,10,13,10, "SELECCIONE UNA OPCION: $"
    m7 db 13,10,13,10,"   лллллллллллллллллллллллллллллллллллллл $"
    m8 db 13,10,      "   л         ORDENAR 3 NUMEROS          л $"
    m9 db 13,10,      "   лллллллллллллллллллллллллллллллллллллл $" 
    m10 db 13,10,      "   л         ORDENAR 4 NUMEROS          л $"  
    
    m11 db 13,10,13,10,"INGRESE EL PRIMER NUMERO: $"
    m12 db 13,10,13,10,"INGRESE EL SEGUNDO NUMERO: $"
    m13 db 13,10,13,10,"INGRESE EL TERCER NUMERO: $"
    m14 db 13,10,13,10,"INGRESE EL CUARTO NUMERO: $" 
    m15 db 13,10,13,10,"ASCENDENTE: $" 
    m16 db 13,10,13,10,"DESCENDENTE: $"
    
.code
    Inicio:  
        mov ax,@data
        mov ds,ax
        
        mov ah,09h
        lea dx,m0
        int 21h
        
        mov ah,09h
        lea dx, m1
        int 21h
        
        mov ah, 09h
        lea dx, m2 
        int 21h
        
        mov ah,09h
        lea dx, m3
        int 21h
        
        mov ah,09h
        lea dx,m4
        int 21h
        
        mov ah ,09h
        lea dx, m5
        int 21h
        
        mov ah,09h
        lea dx, m0
        int 21h
        
Comparar: ;comparacion para la opcion seleccionada del menu 


    mov ah,09h
    lea dx,m6
    int 21h
    
    mov ah,01h
    int 21h
    
    xor ah,ah
    sub al,30h
    mov opcion,al
    
    mov ah,opcion
    cmp ah,opcion1
    
    jz Ingresarnum 
    
    cmp ah,opcion2
    
    jz Ingresarnum
    
    cmp ah,opcion3
    
    jz Salir
    
    jnz Comparar

    
Ingresarnum: 
    
    mov ah,09h
    lea dx,m7
    int 21h
    
    mov ah,opcion
    cmp ah,opcion2
    jz Titulo2
    
    mov ah,09h
    lea dx,m8
    int 21h
    
    jmp sigue
    
Titulo2:
    mov ah,09h
    lea dx,m10
    int 21h
    
Sigue:
    mov ah,09h
    lea dx,m9
    int 21h

    mov ah,09h
    lea dx,m11 ;Ingreso num 1
    int 21h
    
    mov ah,01h
    int 21h 
    
    sub al,30h
    mov n1,al
    
    mov ah,09h
    lea dx,m12  ;Ingreso num 2
    int 21h
    
    mov ah,01h
    int 21h 
    
    sub al,30h
    mov n2,al
    
    mov ah,09h
    lea dx,m13  ;Ingreso num 3
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov n3,al 
    
    mov ah,opcion
    
    cmp ah,opcion2
    
    jz Cuatro
    
    jmp Mensaje
Cuatro:  ;Toma de datos de la opcion 2 
    
    mov ah,09h
    lea dx,m14  ;Ingreso num 4
    int 21h
    
    mov ah,01h
    int 21h
    
    sub al,30h
    mov n4,al
    
    jmp Mensaje

    
Mensaje:    
    mov ah,09h
    lea dx,m15  ;Mensaje Ascendente
    int 21h
Ordenado: ;inicio comparacion de los nums, se utiliza para la opcion 1 y 2     
    
    xor ah,ah
    mov ah,n1
    cmp ah,n2
    
    jz Sincambio  ;para cuando son iguales
    jns Cambio1   ;para cuando la resta de comparacion da un positivo 
    
Sincambio: ;sin cambios se utiliza para la opcion 1 y 2
    
    mov ah,n2
    cmp ah,n3
    
    jz Imprimir  ;para cuando son iguales
    jns Cambio2  ;para cuando la resta de comparacion da un positivo  


     
Imprimir: ;Imprime los numeros ordenados de la opcion 1
    mov ah,opcion
    cmp ah,opcion2
    
    jz Sincambio2 ;En caso de ser la opcion 2 se manda a otra etiqueta
       
    mov dl,n1
    add dl,30h
    mov ah,02h
    int 21h
    
    mov dl,n2
    add dl,30h
    mov ah,02h
    int 21h 
    
    mov dl,n3
    add dl,30h
    mov ah,02h
    int 21h
    
    ;Descendente 
    
    mov ah,09h
    lea dx,m16
    int 21h
    
    mov dl,n3
    add dl,30h
    mov ah,02h
    int 21h
    
    mov dl,n2
    add dl,30h
    mov ah,02h
    int 21h 
    
    mov dl,n1
    add dl,30h
    mov ah,02h
    int 21h
    
.exit    
    
Cambio1:  ;cambios basados en el metodo burbuja
    mov al,n1
    mov ah,n2
    mov n1,ah
    mov n2,al
    
    xor ah,ah
    mov ah,n2
    cmp ah,n3
    
    jns Cambio2
     
    jmp Ordenado
      
  
Cambio2:  ;cambios basados en el metodo burbuja
    mov al,n2
    mov ah,n3
    mov n2,ah
    mov n3,al
    
    jmp Ordenado
.exit
      
Cambio3: ;cambio solo para la opcion 2
    mov al,n3
    mov ah,n4
    mov n3,ah
    mov n4,al
       
    
    jmp Ordenado
.exit    
     
 
   
     
Impresion2: ;Imprime los numeros ordenados de la opcion 2    
    mov dl,n1
    add dl,30h
    mov ah,02h
    int 21h
    
    mov dl,n2
    add dl,30h
    mov ah,02h
    int 21h 
    
    mov dl,n3
    add dl,30h
    mov ah,02h
    int 21h
    
    mov dl,n4
    add dl,30h
    mov ah,02h
    int 21h
    
    ;Descendente 
    
    mov ah,09h
    lea dx,m16
    int 21h
    
    mov dl,n4
    add dl,30h
    mov ah,02h
    int 21h
    
    mov dl,n3
    add dl,30h
    mov ah,02h
    int 21h
    
    mov dl,n2
    add dl,30h
    mov ah,02h
    int 21h 
    
    mov dl,n1
    add dl,30h
    mov ah,02h
    int 21h
.exit

Sincambio2: ;etiqueta sin cambios de la opcion 2   
    mov ah,n3
    cmp ah,n4
     
    jz  Impresion2
    jns Cambio3
    
    jmp Impresion2
  

Salir:
    mov ax,4c00h
    int 21h     
         

ret





