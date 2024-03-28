.data
;визначення даних, які будуть використовуватись 
    oneChar db ?
;змінна в один байт, яка буде зберігати один символ, який буде зчитуватись
    searchParam db 255 dup(?)
;масив байтів, розмірності 255, що ініціалізується ?-пустими значеннями
;dup?-для невизначенності довжини масиву, та для зберігання параметрів 
    currentLine db 255 dup(?)
;ініціалізація пустого масиву
count dw 0

_start: 
read_next:
;мітка для блоку коду для зчитування наступного символу з стандартного вводу 
        mov ah, 3Fh       ; Function 3Fh - read from a file or device
        mov bx, 0         ; stdin - input descriptor (standard input)
        mov cx, 1         ; Read 1 byte
        mov dx, offset oneChar ; Pointer to variable for storing one character
        int 21h           ; Call system interrupt for reading
;це все викликає інструкціх для зчитування з файлу, налаштування реєстрів:
;дескриптор файлу(0- стандартний ввід), к-ть байт для зчитування, та адресу куди зберігатиметься зчитаний символ

        or ax, ax         ; Check if ax is zero (end of file)
        jz read_end       ; If ax = 0, it means the end of the file was reached
;це все для перевірки чи досягнуто кінця файлу 
;якщо ах- результат, що містить результат операції читання, =0 , то до кінця файлу пройдено
;і завершуємо операцію

        mov al, [oneChar] ; 
    ;зчитання символу, який прочитано, збереження в регістр аель
        mov [currentLine + si], al  
    ;збереження в масиві currentLine за допомогою індекса сі 

        mov dl, [currentLine + si]       
        mov ah, 02h 
    ;викликання функції дос для виводу символу на екран                 
        int 21h       
    ;викликання системного виклику дос                    
;інструкції для виведення прочитаного символу на екран 
        inc si ; 
        ;збільшення значення сі для переходу до настпної позицїі в масиві для зберігання наст символу 

        cmp al, 0Ah     
        jz find_string_count_preparation       ; If it's a newline, handle accordingly (new_line code not shown here)
;перевірка, чи прочитаний символ, є початком нового рядка, якщо це так то переходить до обробки рядка
        jmp read_next   
    ;повторення циклу зчитування якщо кінець файлу ще не досягнутий, то програма продовжує зчитувати символи з стандартного ввдоду 


decimal_to_binary: 
	.CODE 
		MAIN PROC FAR 
			MOV AX, 
	@DATA 
		MOV DS, 
	AX 

;load the value stored; 
in variable d1 
	mov ax, 
	d1 

;convert the value to binary; 
print the value 
	CALL PRINT 

;interrupt to exit
	MOV AH, 
	4CH INT 21H 

	MAIN ENDP 
		PRINT PROC 

;initialize count 
	mov cx, 
	0 mov dx, 0 label1:; 
if
	ax is zero 
		cmp ax, 
		0 je print1 

;initialize bx to 2 mov bx, 2 

;divide it by 2 
;to convert it to binary 
	div bx 

;push it in the stack 
	push dx 

;increment the count 
	inc cx 

;set dx to 0 
	xor dx, 
	dx 
		jmp label1 
			print1: 

;check if count 
;is greater than zero 
	cmp cx, 
	0 je exit

;pop the top of stack 
	pop dx 

;add 48 so that it 
;represents the ASCII 
;value of digits 
	add dx, 
	48 

;interrupt to print a 
;character 
	mov ah, 
	02h int 21h 

;decrease the count 
	dec cx 
		jmp print1 
			exit : ret 
					PRINT ENDP 
						END MAIN 


;сортування масиву слів:
bubble_sort: 
array DW 3, 2, 6, 4, 1 
;оголошення масиву 16-бітними (Word) елементів та ініціалізація їхнього значення 
count DW 5
;змінна, яка зберігає кількість елеметнів в масиві 
    mov cx, word ptr count
;копіювання значення к-ті елементів до регістру cx
    dec cx  ; count-1
;зменшення cx на 1 , cx для індексації елементів масиву в подальшому
outerLoop:
;мітка для зовнішнього циклу
    push cx
;запис значення к-ті елементів в стек щоб потім використати його в внутріш. циклі а потім лише повернутись до цього значення 
    lea si, array
;завантаження адреси початку масиву в регістр, для доступу до елеметнів масиву 
;si- регістр для зберігання адреси памʼяті
innerLoop:
;мітка для внутрішнього циклу
    mov ax, [si]
;завантаження значення елементу масиву, на який вказує сі у регістр ах
    cmp ax, [si+2]
;порівняння поточного елементу з наступним
    jl nextStep
;перехід до цієї мітки якщо значення поточного менше за наступного
    xchg [si+2], ax
;обмін цих значень  
    mov [si], ax
;збереження даних, які лежать в регістрі ах, збережуться в памʼять за адресою в регістрі сі 
nextStep:
    add si, 2
;вказуємо на наступний елемент масиву 
    loop innerLoop
;повторення циклу, , зменшення сх на 1, поки не =0
    pop cx
;відновлення попереднього значення сх з стеку 
    loop outerLoop
;повторення зовнішнього циклу, але це для к-ті елементів в масиві -1



calculate_median: 
mov ax, 0
mov bx, count
mov dx, bx
shr bx, 1         ; розрахунок середнього значення для знаходження медіани
jnc no_remainder
inc ax            ; у випадку непарної кількості елементів
no_remainder:
mov si, 0
mov cx, bx        ; використання cx як лічильника для знаходження медіани
calculate_median_loop:
add ax, [array + si]
add si, 2
loop calculate_median_loop
mov dx, ax
mov ax, bx
div dx            ; ділення суми на кількість елементів


calculate_average: 
mov ax, 0          ; Зберігаємо суму чисел у регістрі AX
mov si, 0          ; Ініціалізуємо індекс для доступу до елементів масиву
mov cx, count      ; Копіюємо кількість елементів у лічильник
calculate_average_loop:
    add ax, [array + si]  ; Додаємо поточне число до суми
    add si, 2             ; Переходимо до наступного числа в масиві
    loop calculate_average_loop  ; Повторюємо для кожного числа у масиві

; Завершуємо обчислення середнього арифметичного, ділячи суму на кількість чисел
mov dx, 0
mov bx, count      ; Завантажуємо кількість чисел у регістр BX
div bx             ; AX = AX / BX
