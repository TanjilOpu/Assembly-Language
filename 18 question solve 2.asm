.model small
.stack 100h
.data
msg1 db 'Enter first input $'
msg2 db 13,10,'Enter second input $'
resut db 13,10,'Result = $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h 
    mov bl,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
   
   mov ah,2
   mov dl,bl
   int 21h   
   
    mov dl,13
   int 21h
   
   mov dl,10
   int 21h
  
   
   
   mov ah,9
   lea dx,msg1
   int 21h
   
   mov ah,1
   int 21h
   mov bl,al
   
   mov ah,9
   lea dx,msg2
   int 21h
   
   mov ah,1
   int 21h
   mov bh,al  
   
   mov ah,9
   lea dx,resut
   int 21h
   
   add bl,bh
   sub bl,48d
   
   mov ah,2
   mov dl,bl
   int 21h
   
   exit:
   mov ah,4ch
   int 21h
   main endp 
end main
   
   
   
    