.model small
.stack 100h
.data 
arr db 5 dup(?)

len equ 5
msg1 db 'enter 5 char $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov cx,len
    mov si,0
    input_loop:
    mov ah,1
    int 21h
    mov arr[si],al
    push ax
    inc si
    loop input_loop
    
    mov cx,len
    mov si,0
    
    reverse: 
    pop ax
    mov arr[si],al
    inc si
    loop reverse
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov cx,len
    mov si,0
    display:
    mov ah,2
    mov dl,arr[si]
    int 21h
    inc si
    loop display
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    