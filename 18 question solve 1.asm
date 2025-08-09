.model small
.stack 100h
.data
msg1 db 'Enter the input $'
msg2 db 'Upper case of the input  $'
msg3 db 'Lower case of the input   $'
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
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13 
    int 21h
    mov dl,bl
    int 21h 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    cmp bl,'A'
    jl exit 
     cmp bl,'Z'
     jg smallchar
     
     mov ah,9
     lea dx,msg3  
     int 21h
     
     add bl,32
     
     mov ah,2
     mov dl,bl
     int 21h
     
     jmp exit 
     
     smallchar: 
     
     cmp bl,'a'
     jl exit
     cmp bl,'z'
     jg exit
     
     mov ah,9
     lea dx,msg2
     int 21h
     
     sub bl,32
     
     mov ah,2
     mov dl,bl
     int 21h
     
     
    
    exit:
    mov ah,4ch
    int 21h
    main endp 
end main