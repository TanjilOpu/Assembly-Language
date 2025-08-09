.model small
.stack 100h
.data
input1 db 13,10,'enter a number less than 6 ',13,10,'$'
input2 db 13,10,'enter a number less than  5 ',13,10,'$'
sresult db 13,10,'sum Result  = $'
subr db 13,10, 'subtraction result  = $'  


.code
main proc
    mov ax,@data
    mov ds,ax
    
    
    mov ah,9
    lea dx,input1
    int 21h 
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,9
    lea dx,input2
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al 
    
    mov cl,bl
    add cl,bh
    sub cl,48
    
    ;add bl,bh
    ;sub bl,48
    
    mov ah,9
    lea dx,sresult
    int 21h
    
    mov ah,2
    mov dl,cl
    int 21h
    
    mov ah,9
    lea dx,subr
    int 21h
    
     mov cl,bl
     sub cl,bh
     add cl,48d
     
     mov ah,2
     mov dl,cl
     int 21h
     
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
  
    
    
    