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
		L11:
			mov bx, [ds:si]
			mov [ds:si+120h], bx
			add si,2
			loop L11
		mov cx, 256
		L21:
			mov bx, [ds:si]
			mov [ds:si+120h], bx
			add si,2
			loop L21
		mov cx, 256
		L31:
			mov bx, [ds:si]
			mov [ds:si+120h], bx
			add si,2
			loop L31
		mov cx, 256
		L41:
			mov bx, [ds:si]
			mov [ds:si+120h], bx
			add si,2
			loop L41
		mov cx, 256
		L51:
			mov bx, [ds:si]
			mov [ds:si+120h], bx
			add si,2
			loop L51
	endp copy 

		;Копіювання до стеку
		mov cx, 256
		xor si, si                       
    	stackLoop:
        	mov ax,[ds:[si]]             
        	push ax                      
        	add si, 2                    
        	loop stackLoop


	

Exit:
	mov ah,04ch
	mov al,[exCode]			; отримання коду виходу 
	int 21h				; виклик функції DOS 4ch
	
	

	proc data_set
		mov bp, 0FF6h
		mov al, 2
		mov [bp], al
		sub bp, 2
		mov al, 5
		mov [bp], al
		sub bp, 2
		mov al, 1
		mov [bp], al
		sub bp, 2
		mov al, 1
		mov [bp], al
		sub bp, 2
		mov al, 0
		mov [bp] ,al
		sub bp, 2
		mov al, 1
		mov [bp], al
		sub bp, 2
		mov al, 1
		mov [bp], al
		sub bp, 2
		mov al, 2
		mov [bp] , al
		sub bp, 2
		mov al, 0
		mov [bp] ,al
		sub bp, 2
		mov al, 6
		mov [bp] ,al
		sub bp, 2
		mov al ,0
		mov [bp] ,al
		sub bp, 2
		mov al, 1
		mov [bp], al
		sub bp, 2
		mov al, 1
		mov [bp], al
		sub bp, 2
		mov al, 2
		mov [bp] ,al 
		sub bp, 2
		mov al, 0
		mov [bp] ,al
		sub bp, 2
		mov al, 2
		mov [bp] ,al
		sub bp, 2
		mov al, 0
		mov [bp] ,al
		sub bp, 2
		mov al, 3
		mov [bp] ,al
		ret
	endp data_set


	;Перенесення масиву в стек
	proc arrToStack
		mov cx, 256
		xor si, si                       
    	stackLoop1:
        	mov ax,[ds:[si]]             
        	push ax                      
        	add si, 2                    
        	loop stackLoop1
		ret
	endp arrToStack

end Start