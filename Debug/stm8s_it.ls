   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  43                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  43                     ; 60 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 64 }
  52  0000 80            	iret
  74                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 73 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 77 }
  83  0001 80            	iret
 105                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 105                     ; 85 
 105                     ; 86 {
 106                     	switch	.text
 107  0002               f_TLI_IRQHandler:
 111                     ; 90 }
 114  0002 80            	iret
 136                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 136                     ; 98 {
 137                     	switch	.text
 138  0003               f_AWU_IRQHandler:
 142                     ; 102 }
 145  0003 80            	iret
 167                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 167                     ; 110 {
 168                     	switch	.text
 169  0004               f_CLK_IRQHandler:
 173                     ; 114 }
 176  0004 80            	iret
 199                     ; 121 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 199                     ; 122 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTA_IRQHandler:
 205                     ; 126 }
 208  0005 80            	iret
 231                     ; 133 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 231                     ; 134 {
 232                     	switch	.text
 233  0006               f_EXTI_PORTB_IRQHandler:
 237                     ; 138 }
 240  0006 80            	iret
 263                     ; 145 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 263                     ; 146 {
 264                     	switch	.text
 265  0007               f_EXTI_PORTC_IRQHandler:
 269                     ; 150 }
 272  0007 80            	iret
 297                     ; 157 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 297                     ; 158 {
 298                     	switch	.text
 299  0008               f_EXTI_PORTD_IRQHandler:
 301  0008 8a            	push	cc
 302  0009 84            	pop	a
 303  000a a4bf          	and	a,#191
 304  000c 88            	push	a
 305  000d 86            	pop	cc
 306  000e 3b0002        	push	c_x+2
 307  0011 be00          	ldw	x,c_x
 308  0013 89            	pushw	x
 309  0014 3b0002        	push	c_y+2
 310  0017 be00          	ldw	x,c_y
 311  0019 89            	pushw	x
 314                     ; 162 	Output_0(Led);
 316  001a b602          	ld	a,_Led+2
 317  001c 88            	push	a
 318  001d b601          	ld	a,_Led+1
 319  001f 88            	push	a
 320  0020 b600          	ld	a,_Led
 321  0022 88            	push	a
 322  0023 cd0000        	call	_Output_0
 324  0026 5b03          	addw	sp,#3
 325                     ; 164 }
 328  0028 85            	popw	x
 329  0029 bf00          	ldw	c_y,x
 330  002b 320002        	pop	c_y+2
 331  002e 85            	popw	x
 332  002f bf00          	ldw	c_x,x
 333  0031 320002        	pop	c_x+2
 334  0034 80            	iret
 357                     ; 171 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 357                     ; 172 {
 358                     	switch	.text
 359  0035               f_EXTI_PORTE_IRQHandler:
 363                     ; 176 }
 366  0035 80            	iret
 388                     ; 223 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 388                     ; 224 {
 389                     	switch	.text
 390  0036               f_SPI_IRQHandler:
 394                     ; 228 }
 397  0036 80            	iret
 420                     ; 235 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 420                     ; 236 {
 421                     	switch	.text
 422  0037               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 426                     ; 240 }
 429  0037 80            	iret
 452                     ; 247 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 452                     ; 248 {
 453                     	switch	.text
 454  0038               f_TIM1_CAP_COM_IRQHandler:
 458                     ; 252 }
 461  0038 80            	iret
 484                     ; 285  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 484                     ; 286  {
 485                     	switch	.text
 486  0039               f_TIM2_UPD_OVF_BRK_IRQHandler:
 490                     ; 290  }
 493  0039 80            	iret
 516                     ; 297  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 516                     ; 298  {
 517                     	switch	.text
 518  003a               f_TIM2_CAP_COM_IRQHandler:
 522                     ; 302  }
 525  003a 80            	iret
 548                     ; 339  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 548                     ; 340  {
 549                     	switch	.text
 550  003b               f_UART1_TX_IRQHandler:
 554                     ; 344  }
 557  003b 80            	iret
 580                     ; 351  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 580                     ; 352  {
 581                     	switch	.text
 582  003c               f_UART1_RX_IRQHandler:
 586                     ; 356  }
 589  003c 80            	iret
 611                     ; 390 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 611                     ; 391 {
 612                     	switch	.text
 613  003d               f_I2C_IRQHandler:
 617                     ; 395 }
 620  003d 80            	iret
 642                     ; 469  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 642                     ; 470  {
 643                     	switch	.text
 644  003e               f_ADC1_IRQHandler:
 648                     ; 474  }
 651  003e 80            	iret
 674                     ; 495  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 674                     ; 496  {
 675                     	switch	.text
 676  003f               f_TIM4_UPD_OVF_IRQHandler:
 680                     ; 500  }
 683  003f 80            	iret
 706                     ; 508 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 706                     ; 509 {
 707                     	switch	.text
 708  0040               f_EEPROM_EEC_IRQHandler:
 712                     ; 513 }
 715  0040 80            	iret
 727                     	xdef	f_EEPROM_EEC_IRQHandler
 728                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 729                     	xdef	f_ADC1_IRQHandler
 730                     	xdef	f_I2C_IRQHandler
 731                     	xdef	f_UART1_RX_IRQHandler
 732                     	xdef	f_UART1_TX_IRQHandler
 733                     	xdef	f_TIM2_CAP_COM_IRQHandler
 734                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 735                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 736                     	xdef	f_TIM1_CAP_COM_IRQHandler
 737                     	xdef	f_SPI_IRQHandler
 738                     	xdef	f_EXTI_PORTE_IRQHandler
 739                     	xdef	f_EXTI_PORTD_IRQHandler
 740                     	xdef	f_EXTI_PORTC_IRQHandler
 741                     	xdef	f_EXTI_PORTB_IRQHandler
 742                     	xdef	f_EXTI_PORTA_IRQHandler
 743                     	xdef	f_CLK_IRQHandler
 744                     	xdef	f_AWU_IRQHandler
 745                     	xdef	f_TLI_IRQHandler
 746                     	xdef	f_TRAP_IRQHandler
 747                     	xdef	f_NonHandledInterrupt
 748                     	xref	_Output_0
 749                     	xref.b	_Led
 750                     	xref.b	c_x
 751                     	xref.b	c_y
 770                     	end
