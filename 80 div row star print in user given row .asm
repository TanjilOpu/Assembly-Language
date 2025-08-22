.MODEL SMALL
.STACK 100H
.DATA
    prompt DB 'Enter number of rows: $'
    stars_per_row DB ? ; Variable to store the calculation result
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    MOV AH, 09H
    LEA DX, prompt
    INT 21H

    ; Read user input (e.g., '5')
    MOV AH, 01H
    INT 21H

    ; Convert ASCII digit to number and store in CL for rows
    SUB AL, '0'     
    MOV CL, AL       ; CL = number of rows (outer loop counter)
    MOV CH, 0        ; Clear CH

    ; Calculate stars per row: 80 / number_of_rows
    MOV BL, AL       ; Move divisor (user input) to BL
    MOV AL, 80       ; Dividend is 80
    MOV AH, 0        ; Clear AH for 8-bit division
    DIV BL           ; AL = AX / BL, AH = remainder
    MOV stars_per_row, AL ; Store the result

    ; Print a newline after input
    MOV AH, 02H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Initialize for displaying characters
    MOV AH, 02H     ; Function for displaying char

OUTER_LOOP:
    MOV BL, stars_per_row  ; BL = stars to print per row (inner loop counter)
    MOV BH, 0        ; Clear BH

INNER_LOOP:
    MOV DL, '*'      ; Display star
    INT 21H
    DEC BL           ; Decrement inner counter
    JNZ INNER_LOOP   ; Repeat inner loop for calculated number of stars

    ; After printing one row, go to next line
    MOV DL, 0DH      ; Carriage return
    INT 21H
    MOV DL, 0AH      ; Line feed
    INT 21H

    LOOP OUTER_LOOP  ; Decrement CX (rows), loop if not zero

    MOV AH, 4CH      ; Return to DOS
    INT 21H
MAIN ENDP
END MAIN
