section .text  
    global _start
    global _exit
    global _SyntaxError
    global _Execute
    global _Add
    global _Sub
    global _Mul

section .data
    userInp: db dup (0)
    instructions: db "PRINT", db "EXIT", "ADD"
_start:
    extern _scanf

    ; Output "BASIC > "

    ; Setup the needed registers
    MOV ESI, "BASIC > "
    
    ; Output
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, ESI
    MOV EDX, 8
    INT 0x80

    ; Get user input
    MOV ECX, userInp
    MOV EDX, 20
    CALL _scanf

    ; Read the user input
    MOV ESI, [userInp]

    ; Check if the user input is valid
    CMP ESI, [instructions]
    JNE _SyntaxError

    CMP ESI, "PRINT"
    JE _PRINT

    CMP ESI, "EXIT"
    JE _exit

    CMP ESI, "ADD"
    JE _Add

    CMP ESI, "SUB"
    JE _Sub

    CMP ESI, "MUL"
    JE _Mul

_PRINT:

    ; Setup the register
    MOV ESI, "Enter > "

    ; Output
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, ESI
    MOV EDX, 8
    INT 0x80

_SyntaxError:
    
    ; Setup the register
    MOV ESI, "Syntax Error!"

    ; Output
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, ESI
    MOV EDX, 13
    INT 0x80

_exit:
    MOV EAX, 1
    XOR EBX, EBX
    INT 0x80

_ADD:

    ; Setup the register
    MOV ESI, "Enter a number > "
    
    ; Output
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, ESI
    MOV EDX, 15
    INT 0x80

    ; Get user input
    MOV ECX, userInp
    MOV EDX, 4
    CALL _scanf

    ; Store user input
    MOV EDI, [ECX]

    ; Output
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, ESI
    MOV EDX, 15
    INT 0x80

    ; Get user input
    MOV ECX, userInp
    MOV EDX, 4
    CALL _scanf

    ; Store user input
    MOV ESI, [ECX]

    ; Add the result
    ADD EDI, ESI

    ; Output the result
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, EDI
    MOV EDX, 4
    INT 0x80

_SUB:

    ; Setup the register
    MOV ESI, "Enter a number > "

    ; Output
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, ESI
    MOV EDX, 15
    INT 0x80

    ; Get input
    MOV ECX, userInp
    MOV EDX, 4
    CALL _scanf


    ; Store input
    MOV EDI, [ECX]

    ; Reset buffer
    MOV BYTE [userInp], 0

    ; Output
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, ESI
    MOV EDX, 15
    INT 0x80

    ; Get input
    MOV ECX, userInp
    MOV EDX, 4
    CALL _scanf

    ; Store input
    MOV ESI, [ECX]

    ; Subtract the result
    SUB EDI, ESI

    ; Output the result
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, EDI
    MOV EDX, 4
    INT 0x80

_Mul:
    ; Setup the register
    MOV ESI, "Enter a number > "

    ; Output
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, ESI
    MOV EDX, 15
    INT 0x80

    ; Get input
    MOV ECX, userInp
    MOV EDX, 4
    CALL _scanf

    ; Store input
    MOV EDI, [ECX]

    ; Output
    MOV EAX, 4
    MOV EBX, 1
    MOV ECX, ESI
    MOV EDX, 15
    INT 0x80

    ; Get input
    MOV ECX, userInp
    MOV EDX, 4
    CALL _scanf

    ; Store input
    MOV ESI, [ECX]

    ; Multiply the result
    MUL ESI, EDI
