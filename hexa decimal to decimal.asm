; converting hex to decimal 0-9 and a-f


.model small
.stack 100h
.data
input db 13,10,'Enter your hex number from 0-9 or A-F  $' 
output db 13,10,'In decimal  = $'
asked db 13,10,' pres y or Y to do it or press any key to exit $',13,10,'$'
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    
    take_input:
    mov ah,9
    lea dx,input
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
    
    cmp bl,'9' 
    jg convert 
    
    mov ah,9
    lea dx,output
    int 21h
    
    
    mov ah,2
    mov dl,bl
    int 21h
    jmp user_asked
    
    
    
    convert:
     sub bl,17  
     
     mov ah,9
     lea dx,output
     int 21h
     
     
     mov ah,2
     mov dl,'1'
     int 21h
     mov dl,bl
     int 21h  
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     jmp user_asked
     
     user_asked:
     mov ah,9
     lea dx,asked
     int 21h
     
     mov ah,1
     int 21h
     mov bl,al
     cmp bl,'y'
     je take_input
     cmp bl,'Y'
     je take_input
     
     jmp exit
     
     exit:
     mov ah,4ch
     int 21h
     main endp 
end main

      
     
     
    
    