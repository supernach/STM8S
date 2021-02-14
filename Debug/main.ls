   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  51                     ; 15 int main()
  51                     ; 16 {
  53                     	switch	.text
  54  0000               _main:
  58                     ; 17 	DeInitAllGPIO();
  60  0000 ad3b          	call	_DeInitAllGPIO
  62                     ; 18 	Pin_Init();
  64  0002 cd0000        	call	_Pin_Init
  66                     ; 20 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV1);
  68  0005 ae0080        	ldw	x,#128
  69  0008 cd0000        	call	_Clock_HSI_Init
  71                     ; 21 	EnableClockMirror(CLK_OUTPUT_CPU, CCO);
  73  000b b602          	ld	a,_CCO+2
  74  000d 88            	push	a
  75  000e b601          	ld	a,_CCO+1
  76  0010 88            	push	a
  77  0011 b600          	ld	a,_CCO
  78  0013 88            	push	a
  79  0014 a608          	ld	a,#8
  80  0016 cd0000        	call	_EnableClockMirror
  82  0019 5b03          	addw	sp,#3
  83                     ; 23 	Exti_Init(BotonIT, 1, EXTI_SENSITIVITY_RISE_FALL);
  85  001b 4b03          	push	#3
  86  001d 4b01          	push	#1
  87  001f b602          	ld	a,_BotonIT+2
  88  0021 88            	push	a
  89  0022 b601          	ld	a,_BotonIT+1
  90  0024 88            	push	a
  91  0025 b600          	ld	a,_BotonIT
  92  0027 88            	push	a
  93  0028 cd0000        	call	_Exti_Init
  95  002b 5b05          	addw	sp,#5
  96                     ; 28 	Output2mhz_Init(Led);
  98  002d b602          	ld	a,_Led+2
  99  002f 88            	push	a
 100  0030 b601          	ld	a,_Led+1
 101  0032 88            	push	a
 102  0033 b600          	ld	a,_Led
 103  0035 88            	push	a
 104  0036 cd0000        	call	_Output2mhz_Init
 106  0039 5b03          	addw	sp,#3
 107  003b               L32:
 109  003b 20fe          	jra	L32
 133                     ; 41 void DeInitAllGPIO(void)
 133                     ; 42 {
 134                     	switch	.text
 135  003d               _DeInitAllGPIO:
 139                     ; 43 	GPIO_DeInit(GPIOB);
 141  003d ae5005        	ldw	x,#20485
 142  0040 cd0000        	call	_GPIO_DeInit
 144                     ; 44 	GPIO_DeInit(GPIOC);
 146  0043 ae500a        	ldw	x,#20490
 147  0046 cd0000        	call	_GPIO_DeInit
 149                     ; 45 	GPIO_DeInit(GPIOD);
 151  0049 ae500f        	ldw	x,#20495
 152  004c cd0000        	call	_GPIO_DeInit
 154                     ; 46 }
 157  004f 81            	ret
 170                     	xdef	_main
 171                     	xdef	_DeInitAllGPIO
 172                     	xref	_Exti_Init
 173                     	xref	_EnableClockMirror
 174                     	xref	_Clock_HSI_Init
 175                     	xref	_Output2mhz_Init
 176                     	xref	_Pin_Init
 177                     	xref.b	_BotonIT
 178                     	xref.b	_CCO
 179                     	xref.b	_Led
 180                     	xref	_GPIO_DeInit
 199                     	end
