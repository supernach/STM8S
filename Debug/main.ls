   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  14                     	bsct
  15  0000               _Led:
  16  0000 5005          	dc.w	20485
  17  0002 20            	dc.b	32
  18  0003               _Pulsador:
  19  0003 500f          	dc.w	20495
  20  0005 20            	dc.b	32
  21  0006               _CCO:
  22  0006 500a          	dc.w	20490
  23  0008 10            	dc.b	16
  63                     ; 27 main()
  63                     ; 28 {
  65                     	switch	.text
  66  0000               _main:
  70                     ; 29 	DeInitAllGPIO();
  72  0000 ad63          	call	_DeInitAllGPIO
  74                     ; 31 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV16);
  76  0002 ae0084        	ldw	x,#132
  77  0005 cd0000        	call	_Clock_HSI_Init
  79                     ; 32 	EnableClockMirror(CLK_OUTPUT_CPU, CCO);
  81  0008 b608          	ld	a,_CCO+2
  82  000a 88            	push	a
  83  000b b607          	ld	a,_CCO+1
  84  000d 88            	push	a
  85  000e b606          	ld	a,_CCO
  86  0010 88            	push	a
  87  0011 a608          	ld	a,#8
  88  0013 cd0000        	call	_EnableClockMirror
  90  0016 5b03          	addw	sp,#3
  91                     ; 34 	Input_Init(Pulsador);
  93  0018 b605          	ld	a,_Pulsador+2
  94  001a 88            	push	a
  95  001b b604          	ld	a,_Pulsador+1
  96  001d 88            	push	a
  97  001e b603          	ld	a,_Pulsador
  98  0020 88            	push	a
  99  0021 cd0000        	call	_Input_Init
 101  0024 5b03          	addw	sp,#3
 102                     ; 36 	Output2mhz_Init(Led);
 104  0026 b602          	ld	a,_Led+2
 105  0028 88            	push	a
 106  0029 b601          	ld	a,_Led+1
 107  002b 88            	push	a
 108  002c b600          	ld	a,_Led
 109  002e 88            	push	a
 110  002f cd0000        	call	_Output2mhz_Init
 112  0032 5b03          	addw	sp,#3
 113  0034               L32:
 114                     ; 40 		if(IsActive(Pulsador)) Output_0(Led);
 116  0034 b605          	ld	a,_Pulsador+2
 117  0036 88            	push	a
 118  0037 b604          	ld	a,_Pulsador+1
 119  0039 88            	push	a
 120  003a b603          	ld	a,_Pulsador
 121  003c 88            	push	a
 122  003d cd0000        	call	_IsActive
 124  0040 5b03          	addw	sp,#3
 125  0042 4d            	tnz	a
 126  0043 2710          	jreq	L72
 129  0045 b602          	ld	a,_Led+2
 130  0047 88            	push	a
 131  0048 b601          	ld	a,_Led+1
 132  004a 88            	push	a
 133  004b b600          	ld	a,_Led
 134  004d 88            	push	a
 135  004e cd0000        	call	_Output_0
 137  0051 5b03          	addw	sp,#3
 139  0053 20df          	jra	L32
 140  0055               L72:
 141                     ; 41 		else Output_1(Led);
 143  0055 b602          	ld	a,_Led+2
 144  0057 88            	push	a
 145  0058 b601          	ld	a,_Led+1
 146  005a 88            	push	a
 147  005b b600          	ld	a,_Led
 148  005d 88            	push	a
 149  005e cd0000        	call	_Output_1
 151  0061 5b03          	addw	sp,#3
 152  0063 20cf          	jra	L32
 176                     ; 47 void DeInitAllGPIO(void)
 176                     ; 48 {
 177                     	switch	.text
 178  0065               _DeInitAllGPIO:
 182                     ; 49 	GPIO_DeInit(GPIOB);
 184  0065 ae5005        	ldw	x,#20485
 185  0068 cd0000        	call	_GPIO_DeInit
 187                     ; 50 	GPIO_DeInit(GPIOC);
 189  006b ae500a        	ldw	x,#20490
 190  006e cd0000        	call	_GPIO_DeInit
 192                     ; 51 	GPIO_DeInit(GPIOD);
 194  0071 ae500f        	ldw	x,#20495
 195  0074 cd0000        	call	_GPIO_DeInit
 197                     ; 52 }
 200  0077 81            	ret
 409                     	xdef	_main
 410                     	xdef	_DeInitAllGPIO
 411                     	xdef	_CCO
 412                     	xdef	_Pulsador
 413                     	xdef	_Led
 414                     	xref	_EnableClockMirror
 415                     	xref	_Clock_HSI_Init
 416                     	xref	_IsActive
 417                     	xref	_Output_1
 418                     	xref	_Output_0
 419                     	xref	_Output2mhz_Init
 420                     	xref	_Input_Init
 421                     	xref	_GPIO_DeInit
 440                     	end
