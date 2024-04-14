;**************************************************************
;*                                                            *
;*  Copyright (C) 2024 PyDOS8                                 *
;*                                                            *
;*  This program is free software: you can redistribute it    *
;*  and/or modify it under the terms of the GNU General       *
;*  Public License as published by the Free Software          *
;*  Foundation, either version 3 of the License, or           *
;*  0.0 any later version.                                    *
;*                                                            *
;*  This program is distributed in the hope that it will be   *
;*  useful, but WITHOUT ANY WARRANTY; without even the        *
;*  implied warranty of MERCHANTABILITY or FITNESS FOR A      *
;*  PARTICULAR PURPOSE.  See the GNU General Public License   *
;*  for more details.                                         *
;*                                                            *
;*  You should have received a copy of the GNU General        *
;*  Public License along with this program.  If not, see      *
;*  <http://www.gnu.org/licenses/>.                           *
;*                                                            *
;**************************************************************   

section .text
    global _start
    global _exit   
    global _SyntaxError
    global _Execute
    global _Add
    global _Sub

section .data
    UserInput: db dup (0)    ; INPUT
    INSTRUCTIONS: DB "PRINT", DB "EXIT", DB "ADD"
    string: db ""
_start:
        ; Include the needed libraries
        EXTERN _printf
        EXTERN _scanf

        ; Output `BASIC >`
        MOV [string], "BASIC > " ; Change the value of the `SyntaxError` variable to "BASIC > "
        MOV ECX, SyntaxError       
        MOV EDX, 8
        CALL _printf

        ; Get user input
        MOV ECX, UserInput  ; Store the input into the `UserInput` buffer
        MOV EDX, 12         ; The maximum input allowed for the buffer
        CALL _scanf         ; Get input for the buffer

        ; Read user input
        MOV ESI, [ECX]     ; Get the user input from the buffer (ECX)

        ; Check if the user input is not a valid instruction
        CMP ESI, [INSTRUCTIONS]
        JNE _SyntaxError
        JE _Execute

_Execute:
    
    ; PRINTING
    ;CMP [ECX], "PRINT"
    ;JE _PRINT

    ; EXITING
    CMP [ECX], "EXIT"
    JE _exit

_SyntaxError:
    ; Change the value of the string variable to 'Syntax Error!'
    MOV [string], "Syntax Error!"

    ; Output `Syntax Error!`
    MOV ECX, string 
    MOV EDX, 12
    CALL _printf

    JMP _start

_exit:
    MOV EAX, 1
    XOR EBX, EBX
    INT 0x80
