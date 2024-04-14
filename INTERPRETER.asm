;**************************************************************
;*                                                            *
;*  Copyright (C) [year] [your name]                          *
;*                                                            *
;*  This program is free software: you can redistribute it    *
;*  and/or modify it under the terms of the GNU General       *
;*  Public License as published by the Free Software          *
;*  Foundation, either version 3 of the License, or           *
;*  (at your option) any later version.                       *
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

section .data
    UserInput: db "BASIC > "
    UserInputLength: equ $ - UserInput
    INP: db dup (0) ; This will store the user's input
    CreateVariable: db "Create a variable > "
    CreateVariableLength: equ $ - CreateVariable
    INSTRUCTIONS:
        DB "EXIT"
        DB "HELP"
        DB "PRINT"
        DB "VAR"
    SyntaxError: db "Syntax Error!"
    SyntaxErrorLength: equ $ - SyntaxError
    InstructionsLength: equ $ - INSTRUCTIONS
    userInputBuf: db dup (0)
    variable: db dup (0)

section .text
    global _start 
    global _SyntaxError
    global _CheckInstruction
    global _exit
    global _help
    global _print
    global _CreateAVariable

_start:
        ; Output `UserInput` variable
        MOV ECX, UserInput
        MOV EDX, UserInputLength
        CALL _printf
        
        ; Include necassary libraries
        EXTERN _printf
        EXTERN _scanf

        ;;;;;;;;;;;;;
        ;   PARSER  ;
        ;;;;;;;;;;;;;

        ; Read user input
        MOV ECX, INP
        MOV EDX, 12
        CALL _scanf

        ; Check if the user input is a valid instruction
        CMP [ECX], [INSTRUCTIONS]
        JE _CheckInstruction
        JNE _SyntaxError


_SyntaxError:
        EXTERN _printf
        MOV ECX, SyntaxError
        MOV EDX, SyntaxErrorLength
        CALL _printf

    ;;;;;;;;;;;;;;;;;;;
    ;   INTERPRETER   ;
    ;;;;;;;;;;;;;;;;;;;
    _CheckInstruction:

        ; EXITING
        CMP [ECX], "EXIT"
        JE _exit

        ; HELP   
        CMP [ECX], "HELP"
        JE _help

        ; PRINT
        CMP [ECX], "PRINT"
        JE _print
    
        ; VAR
        CMP [ECX], "VAR"
        JE _CreateAVariable

_print:
        ; Include necessary functions
        extern _printf
        extern _scanf

        ; Get what to output
        MOV ECX, userInputBuf
        MOV EDX, 12
        CALL _scanf

        MOV ESI, [ECX]
        
        ; Output it
        MOV ECX, ESI
        MOV EDX, 12
        CALL _printf

_help:
        EXTERN _printf
        MOV ECX, [INSTRUCTIONS]
        MOV EDX, InstructionsLength
        CALL _printf

_exit:
        EXTERN _ExitProcess
        XOR ECX, ECX
        XOR EDX, EDX
        CALL _ExitProcess
    
_CreateAVariable:
        EXTERN _scanf
        EXTERN _printf

        ; Output the CreateVariable string
        MOV ECX, CreateVariable
        MOV EDX, CreateVariableLength
        CALL _printf

        ; Get user input
        MOV ECX, variable
        MOV EDX, 12
        CALL _scanf
