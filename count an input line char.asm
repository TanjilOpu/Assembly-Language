.model small
.stack 100h
.data 
    msg1 db 13,10,'Enter char and finish input by pressing Enter key: $'
    msg2 db 13,10,'Total chars in input line = $'
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    ; Print prompt
    mov ah,9
    lea dx,msg1
    int 21h  
    
    xor cx,cx       ; DX = 0, character count
    
take_input:
    mov ah,1         ; Read char with echo
    int 21h
    cmp al,13        ; If Enter pressed (carriage return), exit loop
    je convert
    inc cx           ; Increment character count
    jmp take_input
    
convert:
    ; Print newline for clarity
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov al,cl
    add al,48
    mov ah,2
    mov dl,al
    int 21h
    
    mov ax,cx        ; Move count to AX for division
    mov bx,10        ; Divisor for decimal conversion
    mov cx,0         ; Digit count
    
    ; Convert number in AX to decimal digits on stack
convert_loop:
    xor dx,dx        ; Clear DX before div
    div bx           ; AX / 10; quotient in AX, remainder in DX
    add dl,'0'       ; Convert remainder to ASCII digit
    push dx          ; Push digit to stack
    inc cx           ; Increase digit count
    cmp ax,0
    jne convert_loop
    
    ; Print message before digits
    mov ah,9
    lea dx,msg2
    int 21h
    
    ; Print digits from stack
print_loop:
    cmp cx,0
    je exit_program
    pop dx
    mov ah,2
    int 21h
    dec cx
    jmp print_loop

exit_program:
    mov ah,4Ch       ; Exit program
    int 21h
main endp
end main
