.model small 
.stack 100h
.data
input db 13,10,'Enter a hex digit   $'
output db 13,10,'Lost threee chance to enter hex digit  $' 
hes db 13,10,'Its a hex number $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    xor cx,cx
                
                
   take_input:
   mov ah,9
   lea dx,input
   int 21h
   
   mov ah,1
   int 21h
   
   mov bl,al
   cmp bl,'0'
   jl invalid
   cmp bl,'9'
   jg mustatof
   
   mov ah,9
   lea dx,hes
   int 21h
   jmp exit
   
   
   mustatof:
   cmp bl,'A'
   jl invalid
   cmp bl,'F'
   jg invalid
   
   mov ah,9
   lea dx,hes
   int  21h
   jmp exit
   
   invalid:
   
   inc cx
   cmp cx,3
   je terminate
   
   jmp take_input
   
   
   terminate:
   mov ah,9
   lea dx,output
   int 21h
   jmp exit
   
   
   exit: 
   mov ah,4ch
   int 21h
   
   main endp
end main
   
   