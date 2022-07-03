*   To find the factorial of a given number(N) 
    TTL FactorialofN
	AREA Factorial, CODE, READONLY 
	ENTRY
NUM 
    MOV R0, #6
	MOV R1, R0
LOGIC
    SUBS R1, R1, #1 ; Decrement R1 by one -> R1 = R1 - 1
	BEQ FINISH ; Branch(jump) to FINISH if ZERO flag is set (i.e., when R1 becomes 0) 
	MUL R2, R1, R0 ; R2 = R1*R0
	MOV R0, R2 ; R0 = R2, final result is available in R0          
	BNE LOGIC ; Branch(jump) to LOGIC if ZERO flag is not set 
FINISH 
	END