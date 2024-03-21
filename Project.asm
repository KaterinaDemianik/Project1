.model small
.stack 100h
.data
    array dw 3, 2, 6, 4, 1 ; Define an array of 15 words, initially filled with 0s
    count DW 5
    section .data
    array resw 10000       ; масив для зберігання чисел
    array_end equ $        ; кінець масиву
    num_count dw 0         ; лічильник чисел
    
    median_index dw 0      ; індекс медіани у відсортованому масиві
    median_value dw 0      ; значення медіани
    
    sum dw 0               ; сума всіх чисел
    average dw 0           ; середнє значення
    
    buffer db 255          ; буфер для вводу
    buffer_end equ $       ; кінець буфера
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



section .data
    ; Припускаємо, що дані вже знаходяться у пам'яті
    numbers DW 3, 2, 6, 4, 1
    count   DW 5

section .text
global _start














_start:
    mov ecx, [count]      ; Кількість елементів для сортування
    dec ecx               ; Петля зменшується на 1, оскільки порівнюємо пари

outer_loop:
    push ecx
    mov ecx, [count]      ; Внутрішня петля працює з повною кількістю елементів
    dec ecx
    lea esi, [numbers]    ; Завантажуємо адресу масиву

inner_loop:
    mov ax, [esi]         ; Завантажуємо поточне значення
    cmp ax, [esi+2]       ; Порівнюємо з наступним
    jle skip_swap         ; Якщо порядок правильний, пропускаємо обмін

    ; Міняємо місцями
    xchg ax, [esi+2]
    mov [esi], ax

skip_swap:
    add esi, 2            ; Переміщення до наступного елемента
    loop inner_loop       ; Повторення внутрішньої петлі

    pop ecx
    loop outer_loop       ; Повторення зовнішньої петлі

    ; Далі має йти код для завершення програми або виводу результатів
    ; Наприклад, для Linux за допомогою системного виклику
    mov eax, 1            ; syscall: exit
    xor ebx, ebx          ; status 0
    int 0x80



;підпрограма, що конвертує десяткове значення у вигляді рядка в бінарне представлення (слово) у доповнювальному коді, з додатковою обробкою значень, що виходять за межі 16-бітних чисел
;підпрограма, що сумує 16-бітні числа та накопичує результат в 32-бітному (2 слова). 
;конвертувати десяткове символьне представляння так само, як ви це робили в практичній 2. Для визначення ситуації, коли значення виходить за межі діапазону 16-бітного числа, тестуйте OF після додавання. Наприклад, спробуйте запустити і зверніть увагу на стан OF (спробуйте також додати до від'ємного від'ємне для переповнення в області від'ємних значень):
;mov ax, 7FFFh
;add ax, 0FFFh
;як обрахувати average, коли ми працюємо з 16-бітними числами? Для цього ми можемо результат додавання накопичувати в 32-бітному (DWORD) числі таким чином:

;xor dx,dx       ; DX - 32-bit hi-word
;mov ax, 7FFFh   ; AX - 32-bit lo-word
;add ax, 7FFFh   ; add 16bit signed value
;adc dx, 0       ; note that OF=0! 
;Для обчислення середього, таке 32-бітне значення можна поділити таким чином:

;mov dx, 0FFh
;mov ax, 0h
;mov bx, 1500
;div bx  ; DX:AX / 1500, result in ax




