   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  49                     ; 14 main()
  49                     ; 15 {
  51                     	switch	.text
  52  0000               _main:
  56                     ; 16 	DeInitAllGPIO();
  58  0000 ad29          	call	_DeInitAllGPIO
  60                     ; 17 	Pin_Init();
  62  0002 cd0000        	call	_Pin_Init
  64                     ; 19 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV16);
  66  0005 ae0084        	ldw	x,#132
  67  0008 cd0000        	call	_Clock_HSI_Init
  69                     ; 21 	EXTI_setup();
  71  000b ad31          	call	_EXTI_setup
  73                     ; 25 	Output2mhz_Init(Led);
  75  000d b602          	ld	a,_Led+2
  76  000f 88            	push	a
  77  0010 b601          	ld	a,_Led+1
  78  0012 88            	push	a
  79  0013 b600          	ld	a,_Led
  80  0015 88            	push	a
  81  0016 cd0000        	call	_Output2mhz_Init
  83  0019 5b03          	addw	sp,#3
  84                     ; 26 	Output_1(Led);
  86  001b b602          	ld	a,_Led+2
  87  001d 88            	push	a
  88  001e b601          	ld	a,_Led+1
  89  0020 88            	push	a
  90  0021 b600          	ld	a,_Led
  91  0023 88            	push	a
  92  0024 cd0000        	call	_Output_1
  94  0027 5b03          	addw	sp,#3
  95  0029               L32:
  97  0029 20fe          	jra	L32
 121                     ; 38 void DeInitAllGPIO(void)
 121                     ; 39 {
 122                     	switch	.text
 123  002b               _DeInitAllGPIO:
 127                     ; 40 	GPIO_DeInit(GPIOB);
 129  002b ae5005        	ldw	x,#20485
 130  002e cd0000        	call	_GPIO_DeInit
 132                     ; 41 	GPIO_DeInit(GPIOC);
 134  0031 ae500a        	ldw	x,#20490
 135  0034 cd0000        	call	_GPIO_DeInit
 137                     ; 42 	GPIO_DeInit(GPIOD);
 139  0037 ae500f        	ldw	x,#20495
 140  003a cd0000        	call	_GPIO_DeInit
 142                     ; 43 }
 145  003d 81            	ret
 175                     ; 45 void EXTI_setup(void)
 175                     ; 46 {
 176                     	switch	.text
 177  003e               _EXTI_setup:
 181                     ; 47 		GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_IT);
 183  003e 4b60          	push	#96
 184  0040 4b08          	push	#8
 185  0042 ae500f        	ldw	x,#20495
 186  0045 cd0000        	call	_GPIO_Init
 188  0048 85            	popw	x
 189                     ; 48     ITC_DeInit();
 191  0049 cd0000        	call	_ITC_DeInit
 193                     ; 49     ITC_SetSoftwarePriority(ITC_IRQ_PORTD, ITC_PRIORITYLEVEL_0);
 195  004c ae0602        	ldw	x,#1538
 196  004f cd0000        	call	_ITC_SetSoftwarePriority
 198                     ; 51     EXTI_DeInit();
 200  0052 cd0000        	call	_EXTI_DeInit
 202                     ; 52     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
 204  0055 ae0302        	ldw	x,#770
 205  0058 cd0000        	call	_EXTI_SetExtIntSensitivity
 207                     ; 53     EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 209  005b 4f            	clr	a
 210  005c cd0000        	call	_EXTI_SetTLISensitivity
 212                     ; 55     enableInterrupts();
 215  005f 9a            rim
 217                     ; 56 }
 221  0060 81            	ret
 234                     	xdef	_main
 235                     	xdef	_EXTI_setup
 236                     	xdef	_DeInitAllGPIO
 237                     	xref	_Clock_HSI_Init
 238                     	xref	_Output_1
 239                     	xref	_Output2mhz_Init
 240                     	xref	_Pin_Init
 241                     	xref.b	_Led
 242                     	xref	_ITC_SetSoftwarePriority
 243                     	xref	_ITC_DeInit
 244                     	xref	_GPIO_Init
 245                     	xref	_GPIO_DeInit
 246                     	xref	_EXTI_SetTLISensitivity
 247                     	xref	_EXTI_SetExtIntSensitivity
 248                     	xref	_EXTI_DeInit
 267                     	end
