.model small 
.stack 100h
.data
msg1 db 'Enter first input  $'
msg2 db 'Enter second input $'
newline db 13,10,'$'
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    
    mov ah,1
    int 21h
    
    mov bl,al
    
     mov ah,9
     lea dx,newline
     int 21h
    
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    
    mov ah,1
    int 21h    
                         
    cmp bl,al
    jle printbl
    
    mov bl,al
 
   
   printbl: 
       
   mov ah,9
   lea dx,newline
   int 21h
   
   
   mov ah,2
   mov dl,bl
   int 21h
    
    
   
    exit:
    mov ah,4ch
    int 21h
    
    main endp 
end main