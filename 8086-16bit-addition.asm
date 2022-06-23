MOV CX, 0000H            ; Initialize CX register
<<<<<<< HEAD
MOV AX, 1111H            ; Move 1111H to AX register
MOV BX, F1F1H            ; Move F1F1H to BX register
ADD AH, BX               ; AX = AX + BX
=======
MOV AX, 01111H            ; Move 1111H to AX register
MOV BX, 0F1F1H            ; Move F1F1H to BX register
ADD AX, BX               ; AX = AX + BX
>>>>>>> c3e9ace66f801bef24881fa52357337d27cb3dba
JNC NOCAR                ; Jump to NOCAR if carry flag is not set
INC CX                   ; CX = CX + 1
NOCAR: MOV DX, AX        ; Move value of AX to DX register
