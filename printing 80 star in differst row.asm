.model small
.stack 100h
.data 
msg db 'Enter row $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,1
    int 21h
    
    sub al,'0'        ;; cl = al ; ch = 0  cx = ch+cl = al
    mov cl,al
    mov ch,0
    
     row_loop:
     mov bx,5
     
     star_loop:
     mov ah,2
     mov dl,'*'
     int 21h
     
     dec bx
     jnz star_loop
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     loop row_loop
     
     exit:
     mov ah,4ch
     int 21h
     main endp
end main
    