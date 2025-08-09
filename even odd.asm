.model small 
.stack 100h
.code
main proc
    mov ah,1
    int 21h
    
    ;sub al,48d 
    mov bl,al 
   ; add bl,'0'
    
    cmp al,'1'
    je odd
    cmp al,'3'
    je odd
    
    cmp al,'2'
    je even
    cmp al,'4'
    je even
    
    odd:
      mov ah,2
      mov dl,'o'
      int 21h
      jmp exit
      
      even:
      mov ah,2    
      mov dx,'e'
      int 21h
      
       mov ah,2
       mov dl,10
       int 21h
       mov ah,2
       mov dl,13
       int 21h 
      
      mov ah,2
      mov dl,bl
      int 21h
     
      
      exit:
      mov ah,4ch
      int 21h
      
      main endp
end main