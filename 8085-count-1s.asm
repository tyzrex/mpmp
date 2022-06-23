MVI C, 08H          ; Load data 08H in register C
MVI B, 69H          ; Load data 69H to register B
MVI D, 00H          ; Load data 00H to register D(initialize as counter)

MOV A, B            ; Copy content of register B to accumulator
LOOP: RAR           ; Rotate right accumulator
JNC SKIP            ; Jump if no carry
INR D               ; Increment register D by 1
SKIP : DCR C        ; Decrement register C by 1

MOV A, D            ; Copy content of register D to accumulator
STA 0001H           ; Store the result at 0000H
HLT                 ; Stop the program