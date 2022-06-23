MOV CX, 0000H            ; Initialize CX register
MOV AX, 1111H            ; Move 1111H to AX register
MOV BX, F1F1H            ; Move F1F1H to BX register
ADD AH, BX               ; AX = AX + BX
JNC NOCAR                ; Jump to NOCAR if carry flag is not set
INC CX                   ; CX = CX + 1
NOCAR: MOV DX, AX        ; Move value of AX to DX register