What is more memory efficient? Example #1: ;**************************************************************
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
    msg: db "BASIC > "
    msgLength: equ $ - msg
    UserInput: db dup (0)    ; INPUT
    INSTRUCTIONS: DB "PRINT", DB "EXIT", DB "ADD"
    SyntaxError: db "Syntax Error!"
    SyntaxErrorLength: equ $ - SyntaxError

_start:
        ; Include the needed libraries
        EXTERN _printf
        EXTERN _scanf

        ; Output `msg` variable
        MOV ECX, msg       
        MOV EDX, msgLength
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

_SyntaxError:

    ; Output `Syntax Error!`
    MOV ECX, SyntaxError 
    MOV EDX, SyntaxErrorLength
    CALL _scanf 
