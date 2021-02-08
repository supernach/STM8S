#ifndef CLOCK_H
#define CLOCK_H

#include "stm8s.h"
#include "main.h"
#include "gpio.h"

void DisableAllPeripherals(void);
void Clock_HSI_Init(CLK_Prescaler_TypeDef fHsi, CLK_Prescaler_TypeDef fCpu);
void EnableClockMirror(CLK_Output_TypeDef source, sPin pin);


#endif