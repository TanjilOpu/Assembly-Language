.model small
.stack 100h
.data
msg db 'Binary of 13  $'
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    xor cx,cx
    mov ax,13
    mov bx,2
    
    convert:
    xor dx,dx
    div bx
    add dl,48
    push dx
    inc cx
    cmp ax,0
    jne convert
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    print_binary:
    pop bx
    mov dl,bl
    int 21h
    loop print_binary
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main