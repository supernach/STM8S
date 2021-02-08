#ifndef DELAY_H
#define DELAY_H

#include "stm8s.h"

static @inline void _delay_cycl( unsigned short __ticks )
{
	#define T_COUNT(x) (( x * (FCLK / 1000000UL) )-3)/3)
	// ldw X, __ticks ; insert automaticaly
	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
}

#endif /* DELAY_H */