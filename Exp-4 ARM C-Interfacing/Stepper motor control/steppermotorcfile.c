#include "LPC23xx.h"
void delay(void)
{ 
	int i,j; //generating a delay function with some delay 
  for(i=0; i<0xFF; i++) 
    for(j=0; j<0xFF; j++);
}
int main(void)
{ 
	IODIR0 = 0xFFFFFFFF; //Direction to set Port0 as output
  while(1) //keep on doing
  { 
		IOPIN0=0x00000280; //based on the demo code 
    delay(); //adding some delay
    IOPIN0=0x00000240; //the values for clockwise were 280,180,140,240 
    delay();
    IOPIN0=0x00000140; //so values for anticlockwise would be 280,240,140,180
    delay();
    IOPIN0=0x00000180;
    delay();
  }
return 0;
}