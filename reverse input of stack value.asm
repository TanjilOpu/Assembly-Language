;reverse input of stack value

.model small 
.stack 100h
.data 
msg db 'Enterer input line $'
.code
main proc
    mov ax,@data
 mov ds,ax 
     
  mov ah,9
 
 lea dx,msg

 int 21h                                    
 
 mov cx,0
 

 
 readloop:
 mov ah,1
 int 21h
 cmp al,13
 je done 
 push ax
 inc cx
 jmp readloop
 
 done:
 mov ah,2
 mov dl,13
 int 21h
 mov dl,10
 int 21h
 
 printloop:
 cmp cx,0
 je exit
 pop dx
 mov ah,2
 int 21h  
 dec cx
 jmp printloop
 
 
 exit:
 mov ah,4ch
 int 21h
 main endp
end main
    
 
 
                        
                        
                        
