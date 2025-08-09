
.model small
.stack 100h
.code
main proc
    
    xor cx,cx 
    mov cx,255
    
    mov ah,2
    mov dl,0
    
    print:
    int 21h
    inc dl
    loop print
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main