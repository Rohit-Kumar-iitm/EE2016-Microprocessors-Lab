*    Combine the low four bits of each of the four consecutive bytes     
	 TTL storelowfourbits
	 AREA lowfourbit,CODE,READONLY
     ENTRY
START
     LDR R5,MASK
     LDR R0,=LIST
     LDRB R1,[R0]
     LDRB R2,[R0,#4]!
     LDRB R3,[R0,#4]!
     LDRB R4,[R0,#4]!
     AND R1,R1,R5
     AND R2,R2,R5
     AND R3,R3,R5
     AND R4,R4,R5
     MOV R1,R1,LSL #12
     MOV R2,R2,LSL #8
     MOV R3,R3,LSL #4
     ADD R6,R1,R2
     ADD R6,R6,R3
     ADD R6,R6,R4
     STR R6, RESULT
STOP B STOP
LIST DCD &3A,&1B,&2C,&1D
     ALIGN
MASK DCW &000F
     ALIGN
RESULT DCD 0
   END