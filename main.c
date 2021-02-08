/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s.h"
#include "delay.h"
#include "clock.h"

const uint8_t LED = GPIO_PIN_5;

uint8_t onOFF = 1;



main()
{
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	
	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV16);
	EnableClockMirror(CLK_OUTPUT_CPU);
	
	
	
	GPIO_Init(GPIOB, LED, GPIO_MODE_OUT_PP_HIGH_FAST);
	
	for(;;)
	{
		if(onOFF == 1) 
		{
			GPIO_WriteHigh(GPIOB, LED);
			onOFF = 2;
		}
		else
		{
			GPIO_WriteLow(GPIOB, LED);
			onOFF = 1;
		}
		
		_delay_cycl(1000000);
	}
}

