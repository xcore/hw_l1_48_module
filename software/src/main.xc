#include <xs1.h>
#include <platform.h>

// Xcore 0 Ports
on stdcore[0] : out port p_led = XS1_PORT_8B;


// Write a binary pattern to the LEDS
void test_leds( void )
{
	unsigned int time, temp = 1;
	timer t;

	// Get the initial timer value
	t :> time;

	// Loop forever
	while ( 1 )
	{
		// Write the value out to the port
		p_led <: temp;

		// Increment the value
		temp++;

		// Stop the
		if ( temp > 0x3F )
		{
			temp = 0;
		}

		// Wait for 0.5 second
		t when timerafter(time + 50000000) :> time;
	}
}


// Program Entry Point
int main(void)
{
	par
	{
		// XCore 0
		on stdcore[0] : test_leds( );
	}

	return 0;
}
