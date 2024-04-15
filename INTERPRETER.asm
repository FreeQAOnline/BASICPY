section .text
    global _start
    global _exit
    global _SyntaxError
    global _Read

section .data
    IAmAnIdiot:  db dup(0)    ; User input
    IHateMyself: db "PRINT", "EXIT"

_start:
        extern _scanf
        extern _printf
    
        ; Output `BASIC > `

        ; Setup all of the registers needed
        MOV ESI, "BASIC > "

        ; Output
        MOV ECX, ESI
        MOV EDX, 8
        CALL _printf
        
        ; Get user input
        MOV ECX, IAmAnIdiot   ; Where to store the input
        MOV EDX, 12           ; How many characters are allowed.
        CALL _scanf

        ; Read the user input
        MOV ESI, [ECX]    ; ESI = *ECX

        ; Check if the input is valid
        CMP ESI, IHateMyself
        JNE _SyntaxError
        JE _Read

_SyntaxError:
    MOV ESI, "Syntax Error "
    MOV EDX, 12
    CALL _printf

_Read:
   ; The rest of my crappy code here.
