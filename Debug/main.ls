   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  14                     .const:	section	.text
  15  0000               _LED:
  16  0000 20            	dc.b	32
  17                     	bsct
  18  0000               _onOFF:
  19  0000 01            	dc.b	1
  58                     ; 15 main()
  58                     ; 16 {
  60                     	switch	.text
  61  0000               _main:
  65                     ; 17 	GPIO_DeInit(GPIOB);
  67  0000 ae5005        	ldw	x,#20485
  68  0003 cd0000        	call	_GPIO_DeInit
  70                     ; 18 	GPIO_DeInit(GPIOC);
  72  0006 ae500a        	ldw	x,#20490
  73  0009 cd0000        	call	_GPIO_DeInit
  75                     ; 20 	Clock_HSI_Init(CLK_PRESCALER_HSIDIV1, CLK_PRESCALER_CPUDIV16);
  77  000c ae0084        	ldw	x,#132
  78  000f cd0000        	call	_Clock_HSI_Init
  80                     ; 21 	EnableClockMirror(CLK_OUTPUT_CPU);
  82  0012 a608          	ld	a,#8
  83  0014 cd0000        	call	_EnableClockMirror
  85                     ; 25 	GPIO_Init(GPIOB, LED, GPIO_MODE_OUT_PP_HIGH_FAST);
  87  0017 4bf0          	push	#240
  88  0019 4b20          	push	#32
  89  001b ae5005        	ldw	x,#20485
  90  001e cd0000        	call	_GPIO_Init
  92  0021 85            	popw	x
  93  0022               L52:
  94                     ; 29 		if(onOFF == 1) 
  96  0022 b600          	ld	a,_onOFF
  97  0024 a101          	cp	a,#1
  98  0026 260f          	jrne	L13
  99                     ; 31 			GPIO_WriteHigh(GPIOB, LED);
 101  0028 4b20          	push	#32
 102  002a ae5005        	ldw	x,#20485
 103  002d cd0000        	call	_GPIO_WriteHigh
 105  0030 84            	pop	a
 106                     ; 32 			onOFF = 2;
 108  0031 35020000      	mov	_onOFF,#2
 110  0035 200d          	jra	L33
 111  0037               L13:
 112                     ; 36 			GPIO_WriteLow(GPIOB, LED);
 114  0037 4b20          	push	#32
 115  0039 ae5005        	ldw	x,#20485
 116  003c cd0000        	call	_GPIO_WriteLow
 118  003f 84            	pop	a
 119                     ; 37 			onOFF = 1;
 121  0040 35010000      	mov	_onOFF,#1
 122  0044               L33:
 123                     ; 10 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);  
 126  0044 ae4240        	ldw	x,#16960
 128  0047 9d            nop
 129  0048                L6:
 130  0048 5a             decw X
 131  0049 26fd           jrne L6
 132  004b 9d             nop
 133                      
 135  004c 20d4          	jra	L52
 168                     	xdef	_main
 169                     	xdef	_onOFF
 170                     	xdef	_LED
 171                     	xref	_EnableClockMirror
 172                     	xref	_Clock_HSI_Init
 173                     	xref	_GPIO_WriteLow
 174                     	xref	_GPIO_WriteHigh
 175                     	xref	_GPIO_Init
 176                     	xref	_GPIO_DeInit
 195                     	end
