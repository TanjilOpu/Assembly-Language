
.model small
.stack 100h
.data
msg db 'Enter row size $'
a db '?'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
    sub bl,'0'
    mov a,bl
    
    row_loop:
    
    mov bx,5
    
    star_loop:
    mov ah,2
    mov dl,'*'
    int 21h 
    dec bx
    jnz star_loop
    ;loop star_loop
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    dec a
    jnz row_loop
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main