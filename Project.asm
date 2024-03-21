.model small
.stack 100h
.data
    array dw 3, 2, 6, 4, 1 ; Define an array of 15 words, initially filled with 0s
    count DW 5
.code
main PROC
   mov cx, word ptr count
    dec cx  ; count-1
outerLoop:
    push cx
    lea si, array
innerLoop:
    mov ax, [si]
    cmp ax, [si+2]
    jl nextStep
    xchg [si+2], ax
    mov [si], ax
nextStep:
    add si, 2
    loop innerLoop
    pop cx
    loop outerLoop
main ENDP
END main