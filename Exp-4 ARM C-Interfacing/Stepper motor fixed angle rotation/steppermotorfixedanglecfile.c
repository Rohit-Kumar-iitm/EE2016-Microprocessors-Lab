#include "LPC23xx.h"
void delay() 
{ 
	int i, j;  //generating delay function with some delay 
  for(i = 0;i < 0xFF; i++) 
    for(j = 0;j < 0xFF; j++);
} 
 int main() 
{ 
  IODIR0 = 0xFFFFFFFF; //Direction to set Port0 as output
	for(int i=0; i<0x08; i++) //This finite loops will make it rotate through finite angle and stop
  { 
		IOPIN0 = 0x00000280; 
		delay(); //calling delay function
 		IOPIN0 = 0x00000240; 
		delay(); 
		IOPIN0 = 0x00000140; 
		delay(); 
		IOPIN0 = 0x00000180; 
		delay();  //each for loop makes it rotate for 8°
	} 
  return 0; 
}
