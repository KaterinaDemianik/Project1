.model small
.stack 10000d ;розмір стеку для програми
.386 ;для більш рошширених інструкцій
.data
    oneChar db ?
    searchParam db 255 dup(?)
    currentLine db 255 dup(?)
count dw 0

_start: 

call read_next
call decimal_to_binary
call bubble_sort
call calculate_median
call calculate_average

;вихід
mov eax, 1
    xor ebx, ebx
    int 0x80

read_next:
        mov ah, 3Fh      
        mov bx, 0       
        mov cx, 1    
        mov dx, offset oneChar 
        int 21h        
   or ax, ax       
        jz read_end      
        mov al, [oneChar] ; 
        mov [currentLine + si], al  
        mov dl, [currentLine + si]       
        mov ah, 02h                 
        int 21h       
        inc si ; 
        cmp al, 0Ah     
        jz find_string_count_preparation       
        jmp read_next   
decimal_to_binary: 
	.CODE 
		MAIN PROC FAR 
			MOV AX, 
	@DATA 
		MOV DS, 
	AX 
in variable d1 
	mov ax, 
	d1 
print the value 
	CALL PRINT 
	MOV AH, 
	4CH INT 21H 

	MAIN ENDP 
		PRINT PROC 
	mov cx, 
	0 mov dx, 0 label1:; 
if
	ax is zero 
		cmp ax, 
		0 je print1 
	div bx 
	push dx 
	inc cx 
;set dx to 0 
	xor dx, 
	dx 
		jmp label1 
			print1:  
	cmp cx, 
	0 je exit
	pop dx 
	add dx, 
	48 
	mov ah, 
	02h int 21h 
	dec cx 
		jmp print1 
			exit : ret 
					PRINT ENDP 
						END MAIN 


bubble_sort PROC: 
mov cx, lengthArr
    sub cx, 1
    shl cx, 1
    mov innerLooCn, cx
        
    shr cx, 1
    add cx, 1
    mov outerLoopCnt, cx
    xor di, di
    xor cx, cx
    outerLoop:
         xor si, si
    innerLoop:
        mov ax, numbers[si]
        cmp ax, numbers[si + 2]
        jg incIndex
        xchg numbers[si + 2], ax
        mov numbers[si], ax
        mov cx, 1
    incIndex:
        add si, 2
        cmp si, innerLooCn
        jb innerLoop
        cmp cx, 1
        jne stopLoops
        add di, 1
        cmp di, outerLoopCnt
        jb outerLoop
        stopLoops :
            ret
    BubbleSort ENDP


calculate_median: 
mov ax, 0
mov bx, count
mov dx, bx
shr bx, 1      
jnc no_remainder
inc ax           
no_remainder:
mov si, 0
mov cx, bx 

calculate_median_loop:
add ax, [array + si]
add si, 2
loop calculate_median_loop
mov dx, ax
mov ax, bx
div dx     

calculate_average: 
mov ax, 0  
mov si, 0   
mov cx, count   
calculate_average_loop:
    add ax, [array + si]  
    add si, 2     
    loop calculate_average_loop  
mov dx, 0
mov bx, count      
div bx            