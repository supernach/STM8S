#ifndef GPIO_H
#define GPIO_H

#include "stm8s.h"

typedef struct sPin
{
	GPIO_TypeDef* Puerto;
	GPIO_Pin_TypeDef Pin;
} sPin;

extern sPin Led;
extern sPin CCO;
extern sPin Pulsador;

void Pin_Init(void);
void Input_Init(sPin input);
void Output2mhz_Init(sPin output);
void Output10mhz_Init(sPin output);
void Output_0(sPin output);
void Output_1(sPin output);
bool IsActive(sPin input);




#endif