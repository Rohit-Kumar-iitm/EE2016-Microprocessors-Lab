;
; EE20B111_Problem1.asm
;
; Created: 01-09-2021 14:43:41
; Author : HP
;


;Program to add two 16-bit binary words (given) using 8 bit microprocessor and store it in register(s)
.CSEG ;defines memory space to hold program
      LDI R17, 0b10010001 ;R17 contains 8 LSB bits of first number
	  LDI R16, 0b10100011 ;R16 contains 8 MSB bits of first number; R16 & R17 together represents first number(16 bits)
	  LDI R19, 0b10110010 ;R19 contains 8 LSB bits of second number
	  LDI R18, 0b10100011 ;R18 contains 8 MSB bits of second number; R18 & R19 together represents first number(16 bits)
	  LDI R22, 0b00000000 ;clear R22(whcih holds temporary carry, obtained while adding R17&R19)
	  LDI R23, 0b00000000 ;clear R23(which holds the final carry obtained while adding R16&R18) 
	  ADD R17, R19 ;adding the 8 LSB bits of two numbers
	  BRCC abc ;jump if no carry 
	  LDI R22, 0b00000001 ;else make carry
	  ADC R16, R18 ;adding the 8 MSB bits of two numbers with carry
	  BRCC def ;jump if no carry
	  LDI R23, 0b00000001 ;else make carry
abc:  MOV R21, R17 ;store the result in R21
def:  MOV R20, R16 ;store the result in R20
      NOP ;no operation , end of program 
	  ; order to read final number --> R23, R20, R21

