; Push data onto the stack
LXI H, 0000H     ; Point to the starting address of the source
MOV C, M         ; Copy the block size to C (as counter)
INX H            ; Increase HL by one
loop: LXI D, 0000H ; Clear data on HL
MOV D, M         ; Copy data from the location pointed by HL to D
INX H            ; Increase HL by one
DCR C            ; Decrease counter by one
JZ done          ; Jump to `done` if counter is 0
MOV E, M         ; Copy data from the location pointed by HL to E
INX H            ; Increase HL by one
DCR C            ; Decrease counter by one
done: PUSH D     ; Push DE to stack
JNZ loop         ; Jump to `loop` if counter isn't zero

; Pop data from the stack
LXI H, 0000H     ; Point to the starting address of the source
MOV C, M         ; Copy the block size to C (as counter)
LXI H, 000AH     ; Point to the starting address of the destination
loop_2: POP D    ; Pop data from stack to DE
MOV M, E         ; Copy content of E to the location pointed by HL
INX H            ; Increase HL by one
MOV M, D         ; Copy content of D to the location pointed by HL
INX H            ; Increase HL by one
DCR C            ; Decrease counter by one
JZ done_2        ; Jump to `done_2` if counter is 0
DCR C            ; Decrease counter by one
JNZ loop_2       ; Jump to `loop_2` if counter isn't zero
done_2: HLT      ; Hatija