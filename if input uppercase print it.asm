
.model small 
.stack 100h
.data
msg1 db 'Enter a character   $'
msg2 db 'Input is not an uppercase character  $'
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
    
    cmp bl,'A'
    jl invalid
    
    cmp bl,'Z'
    jg invalid
    
    
    mov ah,2
    mov dl,bl
    int 21h
    jmp exit
    
    invalid:  
    
    mov ah,9 
    lea dx,msg2
    int 21h
    jmp exit
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main