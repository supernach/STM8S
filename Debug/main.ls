   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  50                     ; 14 main()
  50                     ; 15 {
  52                     	switch	.text
  53  0000               _main:
  57                     ; 16 	DeInitAllGPIO();
  59  0000 ad2b          	call	_DeInitAllGPIO
  61                     ; 17 	Pin_Init();
  63  0002 cd0000        	call	_Pin_Init
  65                     ; 19 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
  67  0005 ae0080        	ldw	x,#128
  68  0008 cd0000        	call	_Clock_HSI_Init
  70                     ; 20 	EnableClockMirror(CLK_OUTPUT_CPU, CCO);
  72  000b b602          	ld	a,_CCO+2
  73  000d 88            	push	a
  74  000e b601          	ld	a,_CCO+1
  75  0010 88            	push	a
  76  0011 b600          	ld	a,_CCO
  77  0013 88            	push	a
  78  0014 a608          	ld	a,#8
  79  0016 cd0000        	call	_EnableClockMirror
  81  0019 5b03          	addw	sp,#3
  82                     ; 21 	EXTI_setup();
  84  001b ad23          	call	_EXTI_setup
  86                     ; 25 	Output2mhz_Init(Led);
  88  001d b602          	ld	a,_Led+2
  89  001f 88            	push	a
  90  0020 b601          	ld	a,_Led+1
  91  0022 88            	push	a
  92  0023 b600          	ld	a,_Led
  93  0025 88            	push	a
  94  0026 cd0000        	call	_Output2mhz_Init
  96  0029 5b03          	addw	sp,#3
  97  002b               L32:
  99  002b 20fe          	jra	L32
 123                     ; 38 void DeInitAllGPIO(void)
 123                     ; 39 {
 124                     	switch	.text
 125  002d               _DeInitAllGPIO:
 129                     ; 40 	GPIO_DeInit(GPIOB);
 131  002d ae5005        	ldw	x,#20485
 132  0030 cd0000        	call	_GPIO_DeInit
 134                     ; 41 	GPIO_DeInit(GPIOC);
 136  0033 ae500a        	ldw	x,#20490
 137  0036 cd0000        	call	_GPIO_DeInit
 139                     ; 42 	GPIO_DeInit(GPIOD);
 141  0039 ae500f        	ldw	x,#20495
 142  003c cd0000        	call	_GPIO_DeInit
 144                     ; 43 }
 147  003f 81            	ret
 177                     ; 45 void EXTI_setup(void)
 177                     ; 46 {
 178                     	switch	.text
 179  0040               _EXTI_setup:
 183                     ; 47 		GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_IT);
 185  0040 4b60          	push	#96
 186  0042 4b08          	push	#8
 187  0044 ae500f        	ldw	x,#20495
 188  0047 cd0000        	call	_GPIO_Init
 190  004a 85            	popw	x
 191                     ; 48     ITC_DeInit();
 193  004b cd0000        	call	_ITC_DeInit
 195                     ; 49     ITC_SetSoftwarePriority(ITC_IRQ_PORTD, ITC_PRIORITYLEVEL_0);
 197  004e ae0602        	ldw	x,#1538
 198  0051 cd0000        	call	_ITC_SetSoftwarePriority
 200                     ; 51     EXTI_DeInit();
 202  0054 cd0000        	call	_EXTI_DeInit
 204                     ; 52     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_RISE_FALL);
 206  0057 ae0303        	ldw	x,#771
 207  005a cd0000        	call	_EXTI_SetExtIntSensitivity
 209                     ; 53     EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 211  005d 4f            	clr	a
 212  005e cd0000        	call	_EXTI_SetTLISensitivity
 214                     ; 55     enableInterrupts();
 217  0061 9a            rim
 219                     ; 56 }
 223  0062 81            	ret
 236                     	xdef	_main
 237                     	xdef	_EXTI_setup
 238                     	xdef	_DeInitAllGPIO
 239                     	xref	_EnableClockMirror
 240                     	xref	_Clock_HSI_Init
 241                     	xref	_Output2mhz_Init
 242                     	xref	_Pin_Init
 243                     	xref.b	_CCO
 244                     	xref.b	_Led
 245                     	xref	_ITC_SetSoftwarePriority
 246                     	xref	_ITC_DeInit
 247                     	xref	_GPIO_Init
 248                     	xref	_GPIO_DeInit
 249                     	xref	_EXTI_SetTLISensitivity
 250                     	xref	_EXTI_SetExtIntSensitivity
 251                     	xref	_EXTI_DeInit
 270                     	end
