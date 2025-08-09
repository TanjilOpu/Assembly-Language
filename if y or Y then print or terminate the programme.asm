.model small
.stack 100h
.data
msg1 db 'Enter the input  $'

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
    
    cmp bl,'y'
    je printbl
    cmp bl,'Y'
    je printbl
    
    jmp exit
    
    printbl:
    mov ah,2   
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov dl,bl
    int 21h 
    
    exit:
    mov ah,4ch
    int 21h
    
    
    
 
     
     main endp
end main