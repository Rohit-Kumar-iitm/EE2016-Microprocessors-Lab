#include "LPC23xx.h" ; including the required header file
int main()
{
  FIO3DIR = 0xFF ; Directing(fast I/O) the Port3(LEDs, P3.0-P3.7) as output
	FIO4DIR = 0x00 ; Directing(fast I/O) the Port4(DIP Switches, P4.0-P4.7) as input
	int temp; 
	int LowNibble; Last 4 bits of the input(size is 8 bits)
	int HighNibble; First 4 bits of the input 
	while(1) ;keep on doing
	{
		temp = FIO4PIN; temp stores the input given through Port4 
    LowNibble = temp & 0x0F; Extracting the lownibble
    HighNibble = (temp & 0xF0) >> 4; Extractig the high nibble and properly aligning it
    FIO3PIN = HighNibble*LowNibble;	P3.7 to P3.0 displays the required product	
	}
	return 0;
}