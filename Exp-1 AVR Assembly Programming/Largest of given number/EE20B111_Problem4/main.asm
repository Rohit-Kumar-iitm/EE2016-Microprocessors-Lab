;
; EE20B111_Problem4.asm
;
; Created: 02-09-2021 20:22:44
; Author : HP
;


;Program to find the largest number in a given finite set of binary words
.CSEG ; defines memory space to hold program
         LDI ZL, LOW(DATA<<1) ; load address of first data byte
	     LDI ZH, HIGH(DATA<<1)
	     LDI XL,0x60 ; load SRAM address in X-register
         LDI XH,0x00
         LDI R17, $04 ; load the "number of numbers in DATA" into R17(it tells how many numbers are taken into comparison)
	     LPM R0,Z+ ; get the first number into R0 and post increment Z
	     DEC R17 ; decrement R17 by one 
compare: LPM R1,Z+ ; get the next number into R1 and post Increment Z
         CP R0,R1 ; compare R0 and R1 
	     BRGE status ; jump to branch status if R0 is larger  
	     MOV R0,R1 ; else(i.e., R1 is larger) update R0 with R1 ; R0 contains the largest number(in every loop) 
status:  DEC R17 ; decrement R17 by one 
         BRNE compare ;jump to branch(looping) compare if R17 is not equal to 0(i.e., till when all numbers are not accounted for) 
         ST X,R0 ;else store the result(R0-Largest number) in SRAM  
	     NOP ; End of program , no operation 	   
DATA: .db $3D,$54,$D3,$F9 ;given finite data sets labelled as DATA

