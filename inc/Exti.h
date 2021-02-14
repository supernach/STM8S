#ifndef EXTI_H
#define EXTI_H

/**
@file Exti.c
@brief Proporciona acceso basico a la configuracion de
       interrupciones externas sobre las I/O.
			 
@author Supernach
@date 02/2021
*/

#include "stm8s.h"
#include "Gpio.h"

//extern private uint8_t iPrioridad;

/**
@brief Crea una interrupcion externa sobre el pin definido
			 , se le asigna nivel de prioridad y tipo de flanco
			 de deteccion.
@param Configuracion pin fisico.
@param Nivel de prioridad. 0,1,2,3
@param Tipo de flanco para la deteccion de la interrupcion.
			 EXTI_SENSITIVITY_FALL_LOW,
			 EXTI_SENSITIVITY_RISE_ONLY,
			 EXTI_SENSITIVITY_FALL_ONLY,
			 EXTI_SENSITIVITY_RISE_FALL 
*/
void Exti_Init(sPin pin, uint8_t prioridad, uint8_t flanco);

/**
@brief A partir del puerto definido del pin obtenemos la
			 la direccion del controlador de interrupciones(ITC)
			 de ese puerto.
@param direccion del puerto fisico
@return Direccion del ITC para el puerto.
*/
uint8_t ObtenerPuertoItc(GPIO_TypeDef* puerto);

/**
@brief A partir del puerto definido del pin obtenemos la
			 la direccion de las interrupciones externas de ese
			 puerto.
@param direccion del puerto fisico
@return Direccion de la interrupcion externa para el puerto.
*/
uint8_t ObtenerPuertoExti(GPIO_TypeDef* puerto);

/**
@brief Obenemos la direccion de la prioridad que queramos
			 asignarle a la interrupcion
@param Prioridad de la interrupcion. 0,1,2,3
@return Direccion de la prioridad elegida.
*/
uint8_t ObtenerPrioridad(uint8_t prio);

#endif