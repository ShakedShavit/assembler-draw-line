dseg	segment

	     x0 dw ?
		 y0 dw ?
		 x1 dw ?
		 y1 dw ?
		  A dw ? ;    dy
		  B dw ? ;    dx
		  D dw ?
		  x dw ?
		  y dw ?
    counter dw ?
   octant_0 dw ?
   octant_1 dw ?
   octant_2 dw ?
   octant_3 dw ?
   octant_4 dw ?
   octant_5 dw ?
   octant_6 dw ?
   octant_7 dw ?
      keepX dw ?
      keepY dw ?
 originalX0 dw ?
 originalY0 dw ?
 originalX1 dw ?
 originalY1 dw ?
   

	
dseg	ends
cseg	segment
assume	cs:cseg, ds:dseg


            mov ax, dseg
		    mov ds, ax
			
			
			
		    
			
	 Begin: mov cx, 25
	        mov ah, 2
     clear: mov dl, 10
	        int 21h
			dec cx
			jnz clear
			
	        mov dl, 0
	        mov dh, 0
			mov bh, 0
		    int 10h		  
		   
				 
				 
	        mov ah, 2 ;for printing 'enter x0'
			
			mov dl, 'E'
			int 21h
			mov dl, 'n'
			int 21h
			mov dl, 't'
			int 21h
			mov dl, 'e'
			int 21h
			mov dl, 'r'
			int 21h
			mov dl, ' '
			int 21h
			mov dl, 'x'
			int 21h
			mov dl, '0'
			int 21h
			mov dl, ':'
			int 21h

        
		   
			mov x0, 0
			mov bp, 0 ;the counter that counts the number of digits in the inserted number
	  Here: inc bp
	   
	        mov ah, 1
            int 21h
			cmp al, ' '
			jz y0val 	
			sub al, 30h
            push ax		
	   
	        mov ax, 10
			mul x0
			mov x0, ax
	
   
   
            pop ax
			mov ah, 0
			add x0, ax
	
			
			
			
			jmp Here
			
						
			
			
			
			
			;y0:
			
	 y0val: mov ah, 2
            mov dl, 10
	        int 21h
			
			mov ah, 2
			
			mov dl, 'E'
			int 21h
			mov dl, 'n'
			int 21h
			mov dl, 't'
			int 21h
			mov dl, 'e'
			int 21h
			mov dl, 'r'
			int 21h
			mov dl, ' '
			int 21h
			mov dl, 'y'
			int 21h
			mov dl, '0'
			int 21h
			mov dl, ':'
			int 21h
			
			
			
			mov y0, 0
			mov bp, 0 ;the counter that counts the number of digits in the inserted number
	 Here2: inc bp
	   
	        mov ah, 1
            int 21h
			cmp al, ' '
			jz x1val
			sub al ,30h
            push ax 			
	   
	        mov ax, 10
			mul y0
			mov y0, ax
	
   
   
            pop ax
			mov ah, 0
			add y0, ax
	
			
			
			
			jmp Here2
			
			
					
			
			
			
			
			;x1:

			
	 x1val: mov ah, 2
            mov dl, 10
	        int 21h
			
			mov ah, 2
			
			mov dl, 'E'
			int 21h
			mov dl, 'n'
			int 21h
			mov dl, 't'
			int 21h
			mov dl, 'e'
			int 21h
			mov dl, 'r'
			int 21h
			mov dl, ' '
			int 21h
			mov dl, 'x'
			int 21h
			mov dl, '1'
			int 21h
			mov dl, ':'
			int 21h
			
			
			
			mov x1, 0
			mov bp, 0 ;the counter that counts the number of digits in the inserted number
	 Here3: inc bp
	   
	        mov ah, 1
            int 21h
			cmp al, ' '
			jz y1val 		
			sub al, 30h
            push ax		
	   
	        mov ax, 10
			mul x1
			mov x1, ax
	
   
   
            pop ax
			mov ah, 0
			add x1, ax
		
			
			
			
			jmp Here3
			
			
			
					
			
			
			;y1:
			

	 y1val: mov ah, 2
            mov dl, 10 
	        int 21h

			
			mov ah, 2
			
			mov dl, 'E'
			int 21h
			mov dl, 'n'
			int 21h
			mov dl, 't'
			int 21h
			mov dl, 'e'
			int 21h
			mov dl, 'r'
			int 21h
			mov dl, ' '
			int 21h
			mov dl, 'y'
			int 21h
			mov dl, '1'
			int 21h
			mov dl, ':'
			int 21h
			
			
			
			mov y1, 0
			mov bp, 0 ;the counter that counts the number of digits in the inserted number
	 Here4: inc bp
	   
	        mov ah, 1
            int 21h
			cmp al, ' '
			jz start 
			sub al, 30h
			push ax
            
			  
			  
	        mov ax, 10
			mul y1
			mov y1, ax
	
   
            pop ax
			mov ah, 0			
	        add y1, ax  


			
			
			jmp Here4	
			
		
		
		
			
	 start:

	        mov octant_0, 0
            mov octant_1, 0
            mov octant_2, 0
            mov octant_3, 0
            mov octant_4, 0
            mov octant_5, 0
            mov octant_6, 0
            mov octant_7, 0
		    mov keepX, 0
		    mov keepY, 0
			mov di, x0
			mov si, y0
			mov originalX0, di
			mov originalY0, si
			mov di, x1
			mov si, y1
			mov originalX1, di
			mov originalY1, si
	 
	        jmp Checks_if_dx_is_Negative
	 
	 
            Jump_to_Octant__5: jmp Octant__5
	 
	 
	 
	 
	 
	 
Checks_if_dx_is_Negative: ;is x0 > x1 ?
            mov di, x0
			cmp di, x1
			jg dx_is_Negative
            jmp dx_is_Positive
			
			
			
			
			
			
			
dx_is_Negative: ;the line is in the 2nd or 3rd or 4th or 5th octants (the left side) 

Checks_if_dy_is_Negative: ;is y0 > y1 ?
			mov si, y0
			cmp si, y1
			jg dy_is_Negative
			jmp dy_is_Positive

			
			
			
			
			
dy_is_Negative: ;the line is in the 4th or 5th octants (the bottom of the left side) 

Checks_if_dy_is_Bigger_than_dx: ;is dy > dx ?
            mov si, y0 
			sub si, y1
			mov di, x0
			sub di, x1
			cmp si, di ;cmp (y0 - y1), (x0 - x1)
			jg Jump_to_Octant__5
            jmp Octant__4



dy_is_Positive: ;the line is in the 2nd or 3rd octants (the upper side of the left side) 

Checks_if_dy_is_Bigger_than_dx_2: ;is dy > dx ?
            mov si, y1 
			sub si, y0
			mov di, x0
			sub di, x1
			cmp si, di ;cmp (y1 - y0), (x0 - x1)
			jg Octant__2
            jmp Octant__3










dx_is_Positive: ;the line is in the 0 or 1st or 6th or 7th octants (the right side)

Checks_if_dy_is_Negative_2: ;is y0 > y1 ?
			mov si, y0
			cmp si, y1
			jg dy_is_Negative_2
			jmp dy_is_Positive_2
			
			
			
			Jump_to_Octant__6: jmp Octant__6
			
			
dy_is_Negative_2: ;the line is in the 4th or 5th octants (the bottom of the left side) 

Checks_if_dy_is_Bigger_than_dx_3: ;is dy > dx ?

            mov si, y0 
			sub si, y1
			mov di, x1
			sub di, x0
			cmp si, di ;cmp (y0 - y1), (x1 - x0)
			jg Jump_to_Octant__6
            jmp Octant__7


dy_is_Positive_2: ;the line is in the 0 or 1st octants (the upper side of the left side) 

Checks_if_dy_is_Bigger_than_dx_4: ;is dy > dx ?
		
		    mov si, y1 
			sub si, y0
			mov di, x1
			sub di, x0
			cmp si, di ;cmp (y1 - y0), (x1 - x0)
			jg Octant__1
            jmp Octant__0
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
 Octant__0: 
           
		   inc octant_0
		   jmp The_real_start
	
 Octant__1:      

           mov di, x1
		   mov si, y1
		   mov x1, si
		   mov y1, di		   
		   
		   mov di, x0
		   mov si, y0
		   mov x0, si
		   mov y0, di	
		   
		   inc octant_1
           jmp The_real_start
		   
 Octant__2:

           mov di, x1
		   mov si, y1
		   mov x1, si
		   mov y1, di		   
		   
		   mov di, x0
		   mov si, y0
		   mov x0, si
		   mov y0, di	
		   
		   
		   mov si, y0
		   sub si, y1
		   add y1, si
		   add y1, si
		   
		   
		   inc octant_2
		   jmp The_real_start
		   
 Octant__3: 

		   mov di, x0
		   sub di, x1
		   add x1, di
		   add x1, di
		   
		   inc octant_3
		   jmp The_real_start
		   
 Octant__4: 
		   
		   mov di, x1
		   mov si, x0
		   mov x1, si
		   mov x0, di
		   
		   mov di, y1
		   mov si, y0
		   mov y1, si
		   mov y0, di
		   
		   
		   inc octant_4
		   jmp The_real_start
		   
 Octant__5: 
		   
		   mov di, x1
		   mov si, x0
		   mov x1, si
		   mov x0, di
		   
		   mov di, y1
		   mov si, y0
		   mov y1, si
		   mov y0, di
		   
		   
		   mov di, x1
		   mov si, y1
		   mov x1, si
		   mov y1, di		   
		   
		   mov di, x0
		   mov si, y0
		   mov x0, si
		   mov y0, di	
		   
		   inc octant_5
		   jmp The_real_start
		   
 Octant__6: 
		   
		   mov di, x1
		   mov si, x0
		   mov x1, si
		   mov x0, di
		   
		   mov di, y1
		   mov si, y0
		   mov y1, si
		   mov y0, di
		   
		   
		   mov di, x1
		   mov si, y1
		   mov x1, si
		   mov y1, di		   
		   
		   mov di, x0
		   mov si, y0
		   mov x0, si
		   mov y0, di	
		   
		   
		   mov si, y0
		   sub si, y1
		   add y1, si
		   add y1, si
		   
		   inc octant_6
		   jmp The_real_start
		   
 Octant__7: 
		   
		   mov si, y0
		   sub si, y1
		   add y1, si
		   add y1, si
		   
		   inc octant_7
		   jmp The_real_start
		   
		   
		   
		   
		    
	        
The_real_start:
            mov ah, 0 
		    mov al, 12h		;	640x480		;	16 color
		    ;mov al, 13h	;	320x200		;	256 color
		    int 10h
		
		
	

			mov si, x0 ;2
			mov x, si

			mov si, y0 ;2
			mov y, si




			
		    mov si, y1 ;3 
			mov A, si
			mov si, y0
			sub A, si


		    mov si, x1 ;4
			mov B, si
			mov si, x0
			sub B, si
			
			mov si, A  ;5
			add si, A
			sub si, B
			mov D, si




		
            Draw_Coordinate:
			
			
			mov ah, 0Ch ;6
			mov al, 15
			mov bh, 0
			
			
			cmp octant_0, 1 
			jz Jump_to_octant_Number_0 
			cmp octant_1, 1 
			jz Jump_to_octant_Number_1
            cmp octant_2, 1 
			jz Jump_to_octant_Number_2 
            cmp octant_3, 1 
			jz Jump_to_octant_Number_3	
            cmp octant_4, 1 
			jz Jump_to_octant_Number_4 
            cmp octant_5, 1 
			jz Jump_to_octant_Number_5 		
            cmp octant_6, 1 
			jz Jump_to_octant_Number_6 
            cmp octant_7, 1 
			jz Jump_to_octant_Number_7		
			
			Jump_to_octant_Number_0: jmp octant_Number_0
			Jump_to_octant_Number_1: jmp octant_Number_1
			Jump_to_octant_Number_2: jmp octant_Number_2
			Jump_to_octant_Number_3: jmp octant_Number_3
			Jump_to_octant_Number_4: jmp octant_Number_4
			Jump_to_octant_Number_5: jmp octant_Number_5
			Jump_to_octant_Number_6: jmp octant_Number_6
			Jump_to_octant_Number_7: jmp octant_Number_7
  
			
            octant_Number_0: 
			
            mov cx, x
            mov dx, y
			int 10h
			jmp klk ;klk = inc x
			
			
            octant_Number_1: 
			
            mov cx, y
            mov dx, x
			int 10h
			jmp klk ;klk = inc x
			
			
			octant_Number_2: 
		    
			mov di, x
            mov keepX, di
		    mov si, y
            mov keepY, si
			
			
			mov si, y
			sub si, y0
			sub y, si
			sub y, si
			
			mov di, x
			mov si, y
			mov x, si
			mov y, di
			
			
            mov cx, x
            mov dx, y
			int 10h
			
			mov di, keepX
            mov x, di
		    mov si, keepY
            mov y, si
			
			jmp klk ;klk = inc x
			
			
			octant_Number_3: 

			mov si, x
			
			mov di, x
			sub di, x0
			sub x, di
			sub x, di
			
            mov cx, x
            mov dx, y
			int 10h
			
			mov x, si
			jmp klk ;klk = inc x
			
			
			octant_Number_4: 
			
            mov cx, x
            mov dx, y
			int 10h
			
			jmp klk ;klk = inc x
			
			
			octant_Number_5: 
			
            mov cx, y
            mov dx, x
			int 10h
			
			jmp klk ;klk = inc x
			
			
			octant_Number_6: 
            
			mov di, x
            mov keepX, di
		    mov si, y
            mov keepY, si
			
			
			mov si, y
			sub si, y0
			sub y, si
			sub y, si
			
			mov di, x
			mov si, y
			mov x, si
			mov y, di
			
			
            mov cx, x
            mov dx, y
			int 10h
			
			mov di, keepX
            mov x, di
		    mov si, keepY
            mov y, si
			
			jmp klk ;klk = inc x
			
			
			octant_Number_7: 
			
			mov di, y
			
			mov si, y
			sub si, y0
			sub y, si
            sub y, si
			
            mov cx, x
            mov dx, y
			int 10h
			
			mov y, di
			jmp klk ;klk = inc x
			
			
			
			
			

	   klk: inc x 					   
	   															   
																        
																   ;D = D + 2*dy
			cmp D, 0; if D > 0
			jg D_Greater_than_Zero
			
Return_to_Draw_Coordinate_and_Change_D:


            mov si, y1
			cmp si, y
			jnz floop ;floop has no meaning
			
			mov si, x1
			cmp si, x
			jz againn



	 floop: mov si, D ;floop has no meaning
            add	si, A
            add si, A
            mov D, si
      
            jmp Draw_Coordinate	  
			
		
		
D_Greater_than_Zero:
            inc y; y = y + 1
			mov si, D
			sub si, B
			sub si, B; D = D - 2*dx
			mov D, si
			
			jmp Return_to_Draw_Coordinate_and_Change_D
			




			
			
	againn: 
	        mov si, x1
	
	        mov ah, 0Ch 
			mov al, 13
			mov bh, 0
			mov cx, originalX0
			mov dx, originalY0
			int 10h	  
			mov cx, originalX1
			mov dx, originalY1
			int 10h	  

   againnn:
	        mov ah, 8
	        int 21h
			cmp dl, 'e'
			jnz EndGame
	        mov si, 2
			cmp si, 1
			jnz againnn
	

  EndGame:  int 3
cseg	ends
end		begin

; y = mx + b
; y = (((dy)/(dx)) * x) + b
;(dx) * y = ((dy) * x) + ((x) * b)
; 0 = ((dy) * x) - ((dx) * y) + (((x) * b))

; f(x, y) = 0 = Ax + By + C

; A = dy
; B = (-)dx
; C = (dx) * b

; the starting point is on the line:
; f(x0, y0) = 0

; checking if the next point is (x0 + 1, y0 + 1) or (x0 + 1, y0)
; D = f(x0 + 1, y0 + (1/2)) - f(x0, y0)
; D = [A(x0 + 1) + B(y0 + (1/2)) + C] - [A(x0) + B(y0) + C]
;   = [A(x0) + B(y0) + C + A + (1/2)B] - [A(x0) + B(y0) + C]
;   = A + (1/2)B

; if the difference (D) is positive than the next point is (x0 + 1, y0 + 1)

; for the next point:

; if y1 = y0:
; f(x0 + 2, y0 + (1/2)) - f(x0 + 1, y0 + (1/2)) = A = dy

; if y1 = y0 + 1
; f(x0 + 2, y0 + (3/2)) - f(x0 + 1, y0 + (1/2)) = A + B = dy - dx

; if the difference (D) is positive than the next point is (x0 + 2, y0 + 1) (and not (x0 + 2, y0))


;plotLine(x0,y0, x1,y1)
;  dx = x1 - x0
;  dy = y1 - y0
;  D = 2*dy - dx
;  y = y0

;  for x from x0 to x1
;    plot(x,y)
;    if D > 0
;       y = y + 1
;       D = D - 2*dx
;    end if
;    D = D + 2*dy


















