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
 314                     ; 163 	GPIO_WriteReverse(Led.Puerto, Led.Pin);
 316  001a 3b0002        	push	_Led+2
 317  001d be00          	ldw	x,_Led
 318  001f cd0000        	call	_GPIO_WriteReverse
 320  0022 84            	pop	a
 321                     ; 165 }
 324  0023 85            	popw	x
 325  0024 bf00          	ldw	c_y,x
 326  0026 320002        	pop	c_y+2
 327  0029 85            	popw	x
 328  002a bf00          	ldw	c_x,x
 329  002c 320002        	pop	c_x+2
 330  002f 80            	iret
 353                     ; 172 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 353                     ; 173 {
 354                     	switch	.text
 355  0030               f_EXTI_PORTE_IRQHandler:
 359                     ; 177 }
 362  0030 80            	iret
 384                     ; 224 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 384                     ; 225 {
 385                     	switch	.text
 386  0031               f_SPI_IRQHandler:
 390                     ; 229 }
 393  0031 80            	iret
 416                     ; 236 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 416                     ; 237 {
 417                     	switch	.text
 418  0032               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 422                     ; 241 }
 425  0032 80            	iret
 448                     ; 248 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 448                     ; 249 {
 449                     	switch	.text
 450  0033               f_TIM1_CAP_COM_IRQHandler:
 454                     ; 253 }
 457  0033 80            	iret
 480                     ; 286  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 480                     ; 287  {
 481                     	switch	.text
 482  0034               f_TIM2_UPD_OVF_BRK_IRQHandler:
 486                     ; 291  }
 489  0034 80            	iret
 512                     ; 298  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 512                     ; 299  {
 513                     	switch	.text
 514  0035               f_TIM2_CAP_COM_IRQHandler:
 518                     ; 303  }
 521  0035 80            	iret
 544                     ; 340  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 544                     ; 341  {
 545                     	switch	.text
 546  0036               f_UART1_TX_IRQHandler:
 550                     ; 345  }
 553  0036 80            	iret
 576                     ; 352  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 576                     ; 353  {
 577                     	switch	.text
 578  0037               f_UART1_RX_IRQHandler:
 582                     ; 357  }
 585  0037 80            	iret
 607                     ; 391 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 607                     ; 392 {
 608                     	switch	.text
 609  0038               f_I2C_IRQHandler:
 613                     ; 396 }
 616  0038 80            	iret
 638                     ; 470  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 638                     ; 471  {
 639                     	switch	.text
 640  0039               f_ADC1_IRQHandler:
 644                     ; 475  }
 647  0039 80            	iret
 670                     ; 496  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 670                     ; 497  {
 671                     	switch	.text
 672  003a               f_TIM4_UPD_OVF_IRQHandler:
 676                     ; 501  }
 679  003a 80            	iret
 702                     ; 509 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 702                     ; 510 {
 703                     	switch	.text
 704  003b               f_EEPROM_EEC_IRQHandler:
 708                     ; 514 }
 711  003b 80            	iret
 723                     	xdef	f_EEPROM_EEC_IRQHandler
 724                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 725                     	xdef	f_ADC1_IRQHandler
 726                     	xdef	f_I2C_IRQHandler
 727                     	xdef	f_UART1_RX_IRQHandler
 728                     	xdef	f_UART1_TX_IRQHandler
 729                     	xdef	f_TIM2_CAP_COM_IRQHandler
 730                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 731                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 732                     	xdef	f_TIM1_CAP_COM_IRQHandler
 733                     	xdef	f_SPI_IRQHandler
 734                     	xdef	f_EXTI_PORTE_IRQHandler
 735                     	xdef	f_EXTI_PORTD_IRQHandler
 736                     	xdef	f_EXTI_PORTC_IRQHandler
 737                     	xdef	f_EXTI_PORTB_IRQHandler
 738                     	xdef	f_EXTI_PORTA_IRQHandler
 739                     	xdef	f_CLK_IRQHandler
 740                     	xdef	f_AWU_IRQHandler
 741                     	xdef	f_TLI_IRQHandler
 742                     	xdef	f_TRAP_IRQHandler
 743                     	xdef	f_NonHandledInterrupt
 744                     	xref.b	_Led
 745                     	xref	_GPIO_WriteReverse
 746                     	xref.b	c_x
 747                     	xref.b	c_y
 766                     	end
