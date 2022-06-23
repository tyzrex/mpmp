.MODEL small
.STACK 100H
.DATA
	input1 DB 50, 0, 50 DUP("$")
	input2 DB 50, 0, 50 DUP("$")        
	msg1 DB "string1 :$"
	msg2 DB "string2 :$"
	msg_same DB " The two inputs are same", "$"
	msg_diff DB " The two inputs are different", "$"   
	N_LINE DB 0AH,0DH,"$"
.CODE               
main PROC
	; = Make DS point to the data segment =
	MOV AX, @data
	MOV DS, AX
	
	; = Take inputs from user =  
	LEA DX,MSG1                ; load effective address of MSG1 to DX.
	MOV AH,09H                 ; Move 09H to AH
	INT 21H                    ; display content of dx
	MOV AH, 0AH                ; String input
	MOV DX, OFFSET input1      ; Make DX point to the starting address of input1
	INT 21H                    ; Execute the interrupt (Take 1st string input)
	
	LEA DX,N_LINE              ; load effective address of N_LINE
    MOV AH,09H                 ; Move 09H to AH                                
    INT 21H                    ; Display content of dx
	
	LEA DX,MSG2                ; load effective address of INMSG2 to DX. 
	MOV AH,09H                 ; Move 09H to AH
	INT 21H                    ; display content of dx
	MOV AH, 0AH                ; String input
	MOV DX, OFFSET input2      ; Make DX point to the starting address of input2
	INT 21H                    ; Execute the interrupt (Take 2nd string input)
	
	MOV AH, 09H
	
	; = Check if the lengths of the input are same =
	MOV SI, OFFSET input1      ; Make SI point to the starting address of input1
	INC SI                     ; Make SI point to the length of input1
	MOV CH, [SI]               ; Copy the data pointed by SI to CH
	MOV SI, OFFSET input2      ; Make SI point to the starting address of input2
	INC SI                     ; Make SI point to the length of input2
	MOV CL, [SI]               ; Copy the data pointed by SI to CL
	
	CMP CH, CL                 ; Compare the datas of CH and CL (length of input1 and length of input2)
	JNE not_same               ; If the lengths aren't equal, jump to `not_same`
	
	; = Check if the individual characters are same =
	MOV CH, 00H                ; Empty the higher byte of C (To make CX as counter)
	MOV SI, OFFSET input1      ; Make SI point to the starting address of input1
	ADD SI, 2                  ; Make SI point to the actual data of input1
	MOV DI, OFFSET input2      ; Make DI point to the starting address of input2
	ADD DI, 2                  ; Make DI point to the actual data of input2
ch_cmp:	MOV BH, [SI]               ; Copy the data from SI to BH
	MOV BL, [DI]               ; Copy the data from DI to BL
	CMP BH, BL                 ; Compare the data of BH and BL (Current indexed characters of input1 and input2)
	JNE not_same               ; If the data aren't same, jump to `not_same`
	LOOP ch_cmp                ; Decrease CX and jump to `ch_cmp` till CX isn't equal to 0
	
same:	MOV DX, OFFSET msg_same    ; Make DX point to the starting address of `msg_same`
	INT 21H                    ; Execute the interrupt
	JMP done                   ; Jump unconditionally to `done`
	
not_same:MOV DX, OFFSET msg_diff   ; Make DX point to the starting address of `msg_diff`
	INT 21H                    ; Execute the interrupt

done:	MOV AH, 4CH                ; Return control to the OS
	INT 21H                    ; Execute the interrupt
ENDP main
END main