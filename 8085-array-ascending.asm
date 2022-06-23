LXI H, 0000H            ; Get array size
MOV C, M                ; Store array size to register c
DCR C                   ; Decrement C by 1

REPEAT: MOV D,C         ; Move content of register C to register D
LXI H, 0001H            ; Point to address 0001H
LOOP: MOV A, M          ; Move content of memory to accumulator
INX H                   ; Increment H by 1
CMP M                   ; Compare M with accumulator

JC SKIP                 ; Jump to Skip if carry flag is reset
MOV B, M                ; Copy content of memory to register B
MOV M, A                ; Copy content of accumulator to memory
DCX H                   ; Decrement HL pair by 1
MOV M, B                ; Copy content of register B to memory
INX H                   ; Increment HL pair by 1

SKIP: DCR D             ; D = D - 1
JNZ LOOP                ; Jump to loop if zero flag is reset
DCR C                   ; C = C - 1
JNZ REPEAT              ; Jump to repeat if zero flag is reset
HLT                     ; Terminate the program