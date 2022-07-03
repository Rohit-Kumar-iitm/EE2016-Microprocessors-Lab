;
; EE20B111_Problem1.asm
;
; Created: 01-09-2021 14:43:41
; Author : HP
;


;Program to add two 8-bit binary words (given) and store it in register(s)
.CSEG ;defines memory space to hold program
     LDI ZL, LOW(2*DATA)
	 LDI ZH, HIGH(2*DATA)
	 LPM R1, Z+ ;get the first number into R1
	 LPM R2, Z  ;get the second number into R2
	 LDI R17, 0b00000000 ;clear R3(useed to hold the carry)
	 ADD R1, R2 ;Add R2 to R1 and stores the result in R1, carry flag gets activated
	 BRCC b ;jump to branch b if carry cleared
	 LDI R17, 0b00000001 ;else make the carry
b:	 MOV R10, R1 ;store the result in R10
     NOP ;No operation , end of program 
DATA: .db 0b00001010, 0b00110011 ; to read the number , order to read is R17(carry) R10(sum)




