#include "Exti.h"

//uint8_t iPrioridad;
//EXTI_SENSITIVITY_RISE_FALL
void Exti_Init(sPin pin, uint8_t prioridad, uint8_t flanco)
{
	uint8_t port;
	uint8_t iPrioridad = 0;
	
	InputInt_Init(pin);
	ITC_DeInit();
	
	port = ObtenerPuertoItc(pin.Puerto);
	iPrioridad = ObtenerPrioridad(prioridad);
	
	ITC_SetSoftwarePriority(port, iPrioridad);
                
	EXTI_DeInit();
	port = ObtenerPuertoExti(pin.Puerto);
	EXTI_SetExtIntSensitivity(port, flanco);
	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
                
	enableInterrupts();
}

uint8_t ObtenerPuertoItc(GPIO_TypeDef* puerto)
{
	
	if(puerto == GPIOA)
	{
		return ITC_IRQ_PORTA;
	}
	else if(puerto == GPIOB)
	{
		return ITC_IRQ_PORTB;
	}
	else if(puerto == GPIOC)
	{
		return ITC_IRQ_PORTC;
	}
	else if(puerto == GPIOD)
	{
		return ITC_IRQ_PORTD;
	}
	else if(puerto == GPIOE)
	{
		return ITC_IRQ_PORTE;
	}
	else
	{
		return 100;
	}
}

uint8_t ObtenerPuertoExti(GPIO_TypeDef* puerto)
{
	if(puerto == GPIOA)
	{
		return EXTI_PORT_GPIOA;
	}
	else if(puerto == GPIOB)
	{
		return EXTI_PORT_GPIOB;
	}
	else if(puerto == GPIOC)
	{
		return EXTI_PORT_GPIOC;
	}
	else if(puerto == GPIOD)
	{
		return EXTI_PORT_GPIOD;
	}
	else if(puerto == GPIOE)
	{
		return EXTI_PORT_GPIOE;
	}
	else
	{
		return 100;
	}
}

uint8_t ObtenerPrioridad(uint8_t prio)
{
	if(prio == 0)
	{
		return ITC_PRIORITYLEVEL_0;
	}
	else if(prio == 1)
	{
		return ITC_PRIORITYLEVEL_1;
	}
	else if(prio == 2)
	{
		return ITC_PRIORITYLEVEL_2;
	}
	else if(prio == 3)
	{
		return ITC_PRIORITYLEVEL_3;
	}
	else
	{
		return 100;
	}
}