TITLE ЛР_4 
;------------------------------------------------------------------------------
;ЛР  №4
;------------------------------------------------------------------------------
;------------------------------------I.ЗАГОЛОВОК ПРОГРАМИ--------------------------
IDEAL			; Директива - тип Асемблера tasm 
MODEL small 	; Директива - тип моделі пам’яті 
STACK 4096		; Директива - розмір стеку 
;---------------------------------------------II.МАКРОСИ---------------------------
;Макрос ініцілізації
MACRO M_Init
mov ax, @data
mov ds, ax
mov es, ax
ENDM M_Init
;--------------------III.ПОЧАТОК СЕГМЕНТУ ДАНИХ--------------
DATASEG
;Оголошення двовимірного масиву 16х16
arr_stack dw 6bh, 105h, 9bh, 1f2h, 0d6h, 1deh, 0bbh, 6eh, 65h, 0b7h, 9fh, 113h, 0aeh, 0a8h, 115h, 165h 
		  dw 107h, 132h, 173h, 1b1h, 39h, 12h, 89h, 1dh, 18fh, 110h, 79h, 159h, 0c2h, 8ch, 0a5h, 161h
		  dw 1ch, 0f3h, 0c8h, 0cdh, 0dh, 11bh, 49h, 95h, 76h, 0e1h, 40h, 0f5h, 198h, 36h, 127h, 1e4h 
		  dw 9h, 1bdh, 4h, 1d9h, 1abh, 5ah, 1ebh, 115h, 1h, 157h, 43h, 2ch, 29h, 12fh, 1e4h, 1eeh 
		  dw 0e1h, 183h, 75h, 1deh, 1c7h, 1c9h, 50h, 0dah, 1dh, 4h, 3eh, 42h, 57h, 1bfh, 15eh, 0dh 
		  dw 0f7h, 52h, 172h, 1bfh, 0cah, 11dh, 51h, 6ah, 146h, 62h, 0a0h, 1b1h, 1b7h, 1a3h, 0e6h, 2fh 
		  dw 1b7h, 45h, 100h, 145h, 1b2h, 8eh, 147h, 84h, 129h, 83h, 0d3h, 2fh, 12dh, 1cch, 19eh, 1f2h 
		  dw 2fh, 0c8h, 1cfh, 51h, 1afh, 1a5h, 0e2h, 1a0h, 0dfh, 103h, 174h, 121h, 85h, 2eh, 1b5h, 1c3h
		  dw 6bh, 105h, 9bh, 1f2h, 0d6h, 1deh, 0bbh, 6eh, 65h, 0b7h, 9fh, 113h, 0aeh, 0a8h, 115h, 165h 
		  dw 107h, 132h, 173h, 1b1h, 39h, 12h, 89h, 1dh, 18fh, 110h, 79h, 159h, 0c2h, 8ch, 0a5h, 161h
		  dw 1ch, 0f3h, 0c8h, 0cdh, 0dh, 11bh, 49h, 95h, 76h, 0e1h, 40h, 0f5h, 198h, 36h, 127h, 1e4h 
		  dw 9h, 1bdh, 4h, 1d9h, 1abh, 5ah, 1ebh, 115h, 1h, 157h, 43h, 2ch, 29h, 12fh, 1e4h, 1eeh 
		  dw 0e1h, 183h, 75h, 1deh, 1c7h, 1c9h, 50h, 0dah, 1dh, 4h, 3eh, 42h, 57h, 1bfh, 15eh, 0dh 
		  dw 0f7h, 52h, 172h, 1bfh, 0cah, 11dh, 51h, 6ah, 146h, 62h, 0a0h, 1b1h, 1b7h, 1a3h, 0e6h, 2fh 
		  dw 1b7h, 45h, 100h, 145h, 1b2h, 8eh, 147h, 84h, 129h, 83h, 0d3h, 2fh, 12dh, 1cch, 19eh, 1f2h 
		  dw 2fh, 0c8h, 1cfh, 51h, 1afh, 1a5h, 0e2h, 1a0h, 0dfh, 103h, 174h, 121h, 85h, 2eh, 1b5h, 1c3h 
dateP db "25.11"
dateD db "12.06"
dataS db "12.02"
exCode DB 0
CODESEG
;----------------------VI. ПОЧАТОК СЕГМЕНТУ КОДУ-------------------
Start:
M_Init

xor si,si
	
	;Копіювання масиву 
    proc copy
		mov cx, 256
		L1:
			mov bx, [ds:si]
			mov [ds:si+120h], bx
			add si,2
			loop L1
		mov cx, 256
		L2:
			mov bx, [ds:si]
			mov [ds:si+120h], bx
			add si,2
			loop L2
		mov cx, 256
		L3:
			mov bx, [ds:si]
			mov [ds:si+120h], bx
			add si,2
			loop L3
		mov cx, 256
		L4:
			mov bx, [ds:si]
			mov [ds:si+120h], bx
			add si,2
			loop L4
		mov cx, 256
		L5:
			mov bx, [ds:si]
			mov [ds:si+120h], bx
			add si,2
			loop L5
	endp copy 

	;Копіювання до стеку
	mov cx, 256
	xor si, si                       
    stackLoop:
        mov bx,[ds:si]             
        push bx                      
        add si, 2                    
        loop stackLoop

	proc data_set
		mov bp, 0df6h
		sub sp, 10
		mov ax, 09CFh
		mov [bp], ax
		sub sp, 2
		mov ax, 07D1h
		mov [bp-2], ax
		sub sp, 2
		mov ax, 04B6h
		mov [bp-4], ax
		sub sp, 2
		mov ax, 07D2h
		mov [bp-6], ax
		sub sp, 2
		mov ax, 04B2h
		mov [bp-8], ax
		sub sp, 2
		mov ax, 07D3h
		mov [bp-10], ax
	endp data_set
	

Exit:
	mov ah,04ch
	mov al,[exCode]			; отримання коду виходу 
	int 21h				; виклик функції DOS 4ch
	
	

	
end Start