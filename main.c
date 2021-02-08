/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s.h"
#include "main.h"
#include "delay.h"
#include "clock.h"
#include "gpio.h"

sPin Led = { 
						GPIOB, 
						GPIO_PIN_5
						};
sPin Pulsador = { 
									GPIOD, 
									GPIO_PIN_5,
									};
sPin CCO = { 
						GPIOC, 
						GPIO_PIN_4,
						};
						
void DeInitAllGPIO(void);


main()
{
	DeInitAllGPIO();
	
	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV16);
	EnableClockMirror(CLK_OUTPUT_CPU, CCO);
	
	Input_Init(Pulsador);
	
	Output2mhz_Init(Led);
	
	for(;;)
	{
		if(IsActive(Pulsador)) Output_0(Led);
		else Output_1(Led);
		
		//_delay_cycl(1000000);
	}
}

void DeInitAllGPIO(void)
{
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);
}

