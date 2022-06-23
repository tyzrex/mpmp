.model small
.stack
.data
    string db "Aaja MP ko practical exam$"
.code 

main proc
    mov ax,@data
    mov ds,ax
    lea dx,string
    mov ah,09h
    int 21h
    mov ah,4ch
    int 21h
    main endp
end main
