;
; EE20B111_Problem3.asm
;
; Created: 01-09-2021 16:08:23
; Author : HP
;


;Program to multiply two 8-bit numbers and store the result in register(s)
.CSEG ;defines memory space to hold program
     LDI R16, 0b11111111 ;Load the first number into R16
	 LDI R17, 0b11111111 ;Load the second number into R17
     MUL R16, R17 ; R16 = (R16)*(R17) , the result is stored in R1(MSB) and R0(LSB) 
NOP ; no operation , end of program

