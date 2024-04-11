;a single 64KB segment
.model small
.stack 10000d ;10,000 decimal bytes for the stack
.386 ;для більш рошширених інструкцій (в джер:allowing 32-bit instructions)
.data
    oneChar db ?, '$' ;байтова зміннв для одного симвл(як невизн значення і кінця рядка)
    numbers dw 20000 Dup(?) ; масив щоб зберігати числа на таку кть слів (вага2-байти)
    minusChar dd ?  ;дабл ворд для індикації мінуса лише як символа
   lengthArr dw ? ;для довжини масиву намберів
;---------------------------------->
.code
_start: 

mov ax, @data ;копіювання адресу сегменту даних в регістр ах
;доступ до змінних, оголошених в дата
mov ds, ax ;тепер ця адреса йде в Data Segment 
;цк для процесора для визначення  базової адреси сегменту даних при доступі до памʼяті через інші регістри 
;як bx, si, di дозволяє програмі читати з та записувати в змінні, оголошені в .data.

call read_numbers
call bubble_sort
call calculate_median
call printing
call calculate_average
call printing

;end of the program
mov ax, 4C00h 
;ah отримує значення 4C- функція завершення програми з поверненням коду
; завершення, а al отримує 00- як код завершення програми.
    int 21h ;функція для переривання дос

;---------------------------------->
;щоб читати коритувацькі числа та працювати з ними (перед тим в масив покласти їх)
read_numbers proc
        xor di, di ;обенулення індексних регістрів. цей для ведення поточного індексу у намберс щоб записувались числа     
        xor si, si
        mov numbers[0], 0 ;як індикація ввводу, початку нового рядка, ініціалізація перщого елемету масиву намберс нулем 
        mov minusChar, '+'  ;відстеження знаку поточних чисел, спочатку завжди припускаємо що наст число позитивне

;---------------------------------->
read_next: 
    mov ah, 3Fh      
    mov bx, 0       
    mov cx, 1    
    mov dx, offset oneChar 
     int 21h        
   or ax, ax       
    jz read_end   


    cmp oneChar, ' ' ;чи пробіл?Варіанти: або кінець певного числа, або просто розділювач мід числами
    jz putNum  ;йдем до іншої мітки, щоб зверегти наше число
    cmp oneChar, 13 ;сомвол поврнення каретки CR, ASCII код 13(завершення вводу числа )
    je putNum
    cmp oneChar, 10 ;символ нового рядка LF, ASCII код 10(але означає про завершення числа)
    je putNum
    cmp oneChar, '-'
    je charIsMinus
    cmp oneChar, '0'  ;простими словами "чм є меншим за 0" але від 0 до 9 було до добре
    jb next ;Jump if Below
     cmp oneChar, '9' ;якщо більше ніж 9, чи не перевищує діапазон цифр 
    ja next ;Jump if Above ігнорування та читання наступного символу
    jmp convertChar

    charIsMinus:
        mov minusChar, '-'
        jmp read_next

;----------------------------------
convertChar 
 MAIN PROC FAR 
			MOV AX, 
	@DATA 
		MOV DS, 
	AX 
in variable d1 
	mov ax, 
	d1 
;----------------------------------
 PRINT proc
	MOV AH,02h 
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

;----------------------------------
bubble_sort PROC: 
mov cx, lengthArr ;кть ел копіювати в масив 
    sub cx, 1 ;щоб знати скільки порівнянь треба зробити
    shl cx, 1  ;подвоїти сх бо кожен елемет масиву займає два байти
    mov innerLoop, cx  ;зберігає кть байтів, які потрібно пройти в внутрішньому циклі.
    shr cx, 1
    add cx, 1
    ;кть ітерацій зовн циклу, кть елементів+ 1 
    mov outerLoop, cx
    xor di, di
    xor cx, cx
    outerLoop:
         xor si, si
    innerLoop:
        mov ax, numbers[si]
        cmp ax, numbers[si + 2]
        jg incIndex ;точка переходу для збільшення індексу іф грейтер, і перевірка на продовж циклу
        xchg numbers[si + 2], ax
        mov numbers[si], ax
        mov cx, 1
    incIndex:
        add si, 2
        cmp si, innerLoop;порівеює з тим скільки вього треба пройти
        jb innerLoop ;Jump if Below
        cmp cx, 1 ;чи були обіміни? 
        jne stopLoops ;(Jump if Not Equal)обмінів не було
        add di, 1 ;підрахунок ітерацій, скількм було проходів через масив
        cmp di, outerLoop
        jb outerLoop
        stopLoops :
      ret
     bubble_sort ENDP
;----------------------------------
calculate_median PROC
    mov bx, 2 ;завантажуємо дільник 
    mov di, lengthArr  ;доступ до середніх елеметнів масиву 
    mov ax, lengthArr ;виконання ділення
    div bx  ;ах:bx
    ;Результат ділення зберігається в ax,  остача - в dx
    shr di, 1
    ;зсув бітів di на один вправо ділячм на 2 і визначаючи індекс передини коли кількості елем парна
    shl di, 1 ;зсув бтів вліво, повертаюч до початкового значення, але к ть елем парною.
    cmp dx, 0 ;порівняння остачі ділення з нулем
    je isDivOnTwo
    jmp isNotDivOnTwo
         
    isNotDivOnTwo:
        mov ax, numbers[di] ;в ax покласти середній елемент масиву, брати індекс di
        xor di, di ;поприбирати
        call outputNum ;вивести значення aх
        ret ;вийти з проц 

isDivOnTwo: ;перевірка ситуаці коли к-ть ел парна
    xor dx, dx  ;обнулити для роботи ділення
     ;операція зсуву праворуч (shr)щоб у вищому регістрі (dx)
     ; не залишиться непотрібних значень.
    mov ax, numbers[di - 2] ;завантаження в ax значення одного з середніх елементів масиву
    ;di містить  загальну кть елем якщо рахувати з нуля тому di - 2 дозволяє отримати доступ до першого з двох середніх елем
    add ax, numbers[di] ;додавання в значення ах дургого сер елем
    shr ax, 1 ;зсув біт в ax на один розряд праворуч, щоб діляттна два
    xor di, di ;поприбирати за собою
    call outputNumbers ;вивод числа
    ret вихід з методу
 
 calculate_median ENDP

end start 


;----------------------------------
calculate_average: 
mov ax, 0  
mov si, 0   
mov cx, count  
;---------------------------------- 
calculate_average_loop:
    add ax, [array + si]  
    add si, 2     
    loop calculate_average_loop  
mov dx, 0
mov bx, count      
div bx            