*   To find out whether a given number(of32bitsize) is odd or even 
    TTL OddOrEven
	AREA ODDEVEN, CODE, READONLY  
START
    MOV R0, #7 ;R0 = 7 (decimal)
	ANDS R0, #1 ;Bitwise AND operation of the value in R0 with 0x00000001
	SWI &11
FINISH	
	END
	
