
#include "gpio.h"

sPin Led;
sPin Pulsador;
sPin CCO;
sPin BotonIT;

void Pin_Init(void)
{
	Led.Puerto = GPIOB;
	Led.Pin = GPIO_PIN_5;

	Pulsador.Puerto = GPIOD;
	Pulsador.Pin = GPIO_PIN_5;

	CCO.Puerto = GPIOC;
	CCO.Pin = GPIO_PIN_4;
	
	BotonIT.Puerto = GPIOD;
	BotonIT.Pin = GPIO_PIN_3;
}

void Input_Init(sPin input)
{
	GPIO_Init(input.Puerto, input.Pin, GPIO_MODE_IN_PU_NO_IT);
}

void InputInt_Init(sPin input)
{
	GPIO_Init(input.Puerto, input.Pin, GPIO_MODE_IN_PU_IT);
}

void Output2mhz_Init(sPin output)
{
	GPIO_Init(output.Puerto, output.Pin, GPIO_MODE_OUT_PP_LOW_SLOW);
}

void Output10mhz_Init(sPin output)
{
	GPIO_Init(output.Puerto, output.Pin, GPIO_MODE_OUT_PP_LOW_FAST);
}

void Output_0(sPin output)
{
	GPIO_WriteLow(output.Puerto, output.Pin);
}

void Output_1(sPin output)
{
	GPIO_WriteHigh(output.Puerto, output.Pin);
}

bool IsActive(sPin input)
{
	if(GPIO_ReadInputPin(input.Puerto, input.Pin)) return 1;
	else return 0;
}