/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s.h"
#include "gpio.h"
#include "delay.h"
#include "Clock.h"
						
void DeInitAllGPIO(void);
void EXTI_setup(void);


main()
{
	DeInitAllGPIO();
	Pin_Init();
	
	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
	EnableClockMirror(CLK_OUTPUT_CPU, CCO);
	EXTI_setup();
	
	//Input_Init(Pulsador);
	
	Output2mhz_Init(Led);
	//Output_1(Led);
	
	for(;;)
	{
		//Output_0(Led);
		/*if(IsActive(Pulsador)) Output_0(Led);
		else Output_1(Led);*/
		
		//_delay_cycl(1000000);
	}
}

void DeInitAllGPIO(void)
{
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);
}

void EXTI_setup(void)
{
		GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_IT);
    ITC_DeInit();
    ITC_SetSoftwarePriority(ITC_IRQ_PORTD, ITC_PRIORITYLEVEL_0);
                
    EXTI_DeInit();
    EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_RISE_FALL);
    EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
                
    enableInterrupts();
}

