;
; interrupt_avr.asm
;
; Created: 22-09-2021 08:11:07
; Author : EE20B111, ROHIT KUMAR
;


.include "m8def.inc"

.org 0x0000;
rjmp reset;

.org 0x0002;
rjmp int1_ISR;

.org 0x0100;

reset:
        ;loading stack pointer address
		LDI R16,0x70;
        OUT SPL,R16;
        LDI R16,0x00;
        OUT SPH,R16; 

        LDI R16,0x01; 
        OUT DDRB,R16; interface port B pin 0(PB0) to be output 

        LDI R16,0x00;
        OUT DDRD,R16; 

        ;Set MCUCR register to enable low level interrupt
		LDI R16, 0x00;
        OUT MCUCR, R16;

        ;Set GICR register to enable interrupt 1
		LDI R16, 0x80;
        OUT GICR, R16;

        LDI R16, 0x00; 
        OUT PORTB, R16;

        SEI;

ind_loop:
    RJMP ind_loop;

int1_ISR:
    IN R16, SREG;
    PUSH R16; push R16 on stack 

    LDI R16, 0x0A; to blink led 10 times  
    MOV R0, R16; i.e., R0 is the counter
 
 ;loops to make LED blink for 1 second
 c1:LDI R16, 0x01
    OUT PORTB, R16;

    LDI R16, 0x63
 a1:LDI R17, 0x63
 a2:LDI R18, 0X21
 a3:DEC R18
    BRNE a3
	DEC R17
	BRNE a2
	DEC R16
	BRNE a1

 c2:LDI R16, 0x00
    OUT PORTB, R16

    LDI R16, 0x63
 b1:LDI R17, 0x63
 b2:LDI R18, 0X21
 b3:DEC R18
    BRNE b3
	DEC R17
	BRNE b2
	DEC R16
	BRNE b1


    DEC R0 ;Each decrement corresponds to one blink in led
    BRNE c1 ;blink untill R0 != 0, i.e., blink 10 times
    POP R16 ;pop R16 from stack(when led has blinked 10 times)
    OUT SREG, R16;

    RETI; after POPing I = 0 

