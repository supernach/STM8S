#ifndef GPIO_H
#define GPIO_H

/**

@file Gpio.c
@brief Con este modulo pretendo abstraerme de las funciones 
			 de la SPL relacionadas con las configuraciones de las
			 distintas I/O. Proporciona un tipo sPin para
			 tener una definicion mas clara de la parte fisica de
			 la I/O.
			 
@author Supernach
@date 2/2021

*/
			 

#include "stm8s.h"

/**
@brief Tipo sPin. Se define el pùerto fisico y el numero de
			 pin fisico que se va a utilizar. Estas dos cosas son
			 muy demandadas por las distintas funciones de la SPL.
			 
@param Define el puerto fisico(GPIOB,GPIOD..).
@param Define el pin Fisico(GPIO_PIN2, GPIO_PIN_3...)

*/
typedef struct sPin
{
	GPIO_TypeDef* Puerto;
	GPIO_Pin_TypeDef Pin;
} sPin;

extern sPin Led;
extern sPin CCO;
extern sPin Pulsador;
extern sPin BotonIT;

/**
@brief Primera inicializacion de las distintas I/O a 
			 utilizar. Aqui se les asigna a valor  a los
			 tipos sPin.
*/
void Pin_Init(void);

/**
@brief Inicializacion como entrada de una I/O. Se configura
			 en modo Pull-Up sin interrupcion.
			 
@param Configuracion fisica del pin.

*/
void Input_Init(sPin input);

/**
@brief Inicializacion como entrada de una I/O. Se configura
			 en modo Pull-Up con interrupcion.
			 
@param Configuracion fisica del pin.

*/
void InputInt_Init(sPin input);

/**
@brief Inicializacion como salida lenta(max 2mhz) de una I/O. Se configura
			 en modo Push-Pull a nivel bajo.
			 
@param Configuracion fisica del pin.

*/
void Output2mhz_Init(sPin output);

/**
@brief Inicializacion como salida rapida(max 10mhz) de una I/O. Se configura
			 en modo Push-Pull a nivel bajo.
			 
@param Configuracion fisica del pin.

*/
void Output10mhz_Init(sPin output);

/**
@brief Poner en nivel bajo la salida correspondiente
			 
@param Configuracion fisica del pin.

*/
void Output_0(sPin output);

/**
@brief Poner en nivel alto la salida correspondiente
			 
@param Configuracion fisica del pin.

*/
void Output_1(sPin output);

/**
@brief Comprobar si una entrada esta a nivel alto
			 
@param Configuracion fisica del pin.

@return Si esta activa o no lo esta

*/
bool IsActive(sPin input);




#endif