   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 176                     ; 4 void Clock_HSI_Init(CLK_Prescaler_TypeDef fHsi, CLK_Prescaler_TypeDef fCpu)
 176                     ; 5 {
 178                     	switch	.text
 179  0000               _Clock_HSI_Init:
 181  0000 89            	pushw	x
 182       00000000      OFST:	set	0
 185                     ; 6 	CLK_DeInit();
 187  0001 cd0000        	call	_CLK_DeInit
 189                     ; 8 	CLK_HSECmd(DISABLE); //Desactivar oscilador externo
 191  0004 4f            	clr	a
 192  0005 cd0000        	call	_CLK_HSECmd
 194                     ; 9 	CLK_LSICmd(DISABLE); //Desactivar oscilador lento interno 128khz
 196  0008 4f            	clr	a
 197  0009 cd0000        	call	_CLK_LSICmd
 199                     ; 11 	CLK_HSICmd(ENABLE); // Activar oscilador interno 16mhz
 201  000c a601          	ld	a,#1
 202  000e cd0000        	call	_CLK_HSICmd
 205  0011               L17:
 206                     ; 13 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE); // Espera hasta que el oscilador este preparado
 208  0011 ae0102        	ldw	x,#258
 209  0014 cd0000        	call	_CLK_GetFlagStatus
 211  0017 4d            	tnz	a
 212  0018 27f7          	jreq	L17
 213                     ; 15 	CLK_ClockSwitchCmd(ENABLE);
 215  001a a601          	ld	a,#1
 216  001c cd0000        	call	_CLK_ClockSwitchCmd
 218                     ; 17 	CLK_HSIPrescalerConfig(fHsi); //fMaster 16mhz
 220  001f 7b01          	ld	a,(OFST+1,sp)
 221  0021 cd0000        	call	_CLK_HSIPrescalerConfig
 223                     ; 18 	CLK_SYSCLKConfig(fCpu); // fCpu 2mhz
 225  0024 7b02          	ld	a,(OFST+2,sp)
 226  0026 cd0000        	call	_CLK_SYSCLKConfig
 228                     ; 21 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
 230  0029 4b01          	push	#1
 231  002b 4b00          	push	#0
 232  002d ae01e1        	ldw	x,#481
 233  0030 cd0000        	call	_CLK_ClockSwitchConfig
 235  0033 85            	popw	x
 236                     ; 23   DisableAllPeripherals();
 238  0034 ad02          	call	_DisableAllPeripherals
 240                     ; 24 }
 243  0036 85            	popw	x
 244  0037 81            	ret
 269                     ; 26 void DisableAllPeripherals(void)
 269                     ; 27 {
 270                     	switch	.text
 271  0038               _DisableAllPeripherals:
 275                     ; 28 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 277  0038 5f            	clrw	x
 278  0039 cd0000        	call	_CLK_PeripheralClockConfig
 280                     ; 29   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 282  003c ae0100        	ldw	x,#256
 283  003f cd0000        	call	_CLK_PeripheralClockConfig
 285                     ; 30   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 287  0042 ae0300        	ldw	x,#768
 288  0045 cd0000        	call	_CLK_PeripheralClockConfig
 290                     ; 31   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 292  0048 ae1200        	ldw	x,#4608
 293  004b cd0000        	call	_CLK_PeripheralClockConfig
 295                     ; 32   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 297  004e ae1300        	ldw	x,#4864
 298  0051 cd0000        	call	_CLK_PeripheralClockConfig
 300                     ; 33   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
 302  0054 ae0700        	ldw	x,#1792
 303  0057 cd0000        	call	_CLK_PeripheralClockConfig
 305                     ; 34   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 307  005a ae0500        	ldw	x,#1280
 308  005d cd0000        	call	_CLK_PeripheralClockConfig
 310                     ; 35   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
 312  0060 ae0400        	ldw	x,#1024
 313  0063 cd0000        	call	_CLK_PeripheralClockConfig
 315                     ; 36 }
 318  0066 81            	ret
 456                     ; 38 void EnableClockMirror(CLK_Output_TypeDef source)
 456                     ; 39 {
 457                     	switch	.text
 458  0067               _EnableClockMirror:
 460  0067 88            	push	a
 461       00000000      OFST:	set	0
 464                     ; 40 	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
 466  0068 4be0          	push	#224
 467  006a 4b10          	push	#16
 468  006c ae500a        	ldw	x,#20490
 469  006f cd0000        	call	_GPIO_Init
 471  0072 85            	popw	x
 472                     ; 41 	CLK_CCOConfig(source);
 474  0073 7b01          	ld	a,(OFST+1,sp)
 475  0075 cd0000        	call	_CLK_CCOConfig
 477                     ; 42   CLK_CCOCmd(ENABLE);
 479  0078 a601          	ld	a,#1
 480  007a cd0000        	call	_CLK_CCOCmd
 482                     ; 44 }
 485  007d 84            	pop	a
 486  007e 81            	ret
 499                     	xdef	_EnableClockMirror
 500                     	xdef	_Clock_HSI_Init
 501                     	xdef	_DisableAllPeripherals
 502                     	xref	_GPIO_Init
 503                     	xref	_CLK_GetFlagStatus
 504                     	xref	_CLK_SYSCLKConfig
 505                     	xref	_CLK_CCOConfig
 506                     	xref	_CLK_HSIPrescalerConfig
 507                     	xref	_CLK_ClockSwitchConfig
 508                     	xref	_CLK_PeripheralClockConfig
 509                     	xref	_CLK_ClockSwitchCmd
 510                     	xref	_CLK_CCOCmd
 511                     	xref	_CLK_LSICmd
 512                     	xref	_CLK_HSICmd
 513                     	xref	_CLK_HSECmd
 514                     	xref	_CLK_DeInit
 533                     	end
