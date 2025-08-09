.model small
.stack 100h
.data
msg1 db 'enter inputline $'
msg2 db 13,10,' total char in inputline  = $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h  
    
    xor cx,cx
    
    take_input:
    mov ah,1
    int 21h
    cmp al,13
    je input_done
    inc cx
    jmp take_input
    
    input_done:
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    mov ax,cx
    mov bx,10
    mov cx,0
    
    convert_loop:
    xor dx,dx
    div bx
    add dl,48
    push dx
    inc cx
    cmp ax,0
    jne convert_loop
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    print_loop:
    pop dx
    mov ah,2
    int 21h
    loop print_loop
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    