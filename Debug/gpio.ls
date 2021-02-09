   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  45                     ; 8 void Pin_Init(void)
  45                     ; 9 {
  47                     	switch	.text
  48  0000               _Pin_Init:
  52                     ; 10 	Led.Puerto = GPIOB;
  54  0000 ae5005        	ldw	x,#20485
  55  0003 bf06          	ldw	_Led,x
  56                     ; 11 	Led.Pin = GPIO_PIN_5;
  58  0005 35200008      	mov	_Led+2,#32
  59                     ; 13 	Pulsador.Puerto = GPIOD;
  61  0009 ae500f        	ldw	x,#20495
  62  000c bf00          	ldw	_Pulsador,x
  63                     ; 14 	Pulsador.Pin = GPIO_PIN_5;
  65  000e 35200002      	mov	_Pulsador+2,#32
  66                     ; 16 	CCO.Puerto = GPIOC;
  68  0012 ae500a        	ldw	x,#20490
  69  0015 bf03          	ldw	_CCO,x
  70                     ; 17 	CCO.Pin = GPIO_PIN_4;
  72  0017 35100005      	mov	_CCO+2,#16
  73                     ; 18 }
  76  001b 81            	ret
 276                     ; 20 void Input_Init(sPin input)
 276                     ; 21 {
 277                     	switch	.text
 278  001c               _Input_Init:
 280       00000000      OFST:	set	0
 283                     ; 22 	GPIO_Init(input.Puerto, input.Pin, GPIO_MODE_IN_PU_NO_IT);
 285  001c 4b40          	push	#64
 286  001e 7b06          	ld	a,(OFST+6,sp)
 287  0020 88            	push	a
 288  0021 1e05          	ldw	x,(OFST+5,sp)
 289  0023 cd0000        	call	_GPIO_Init
 291  0026 85            	popw	x
 292                     ; 23 }
 295  0027 81            	ret
 331                     ; 25 void Output2mhz_Init(sPin output)
 331                     ; 26 {
 332                     	switch	.text
 333  0028               _Output2mhz_Init:
 335       00000000      OFST:	set	0
 338                     ; 27 	GPIO_Init(output.Puerto, output.Pin, GPIO_MODE_OUT_PP_LOW_SLOW);
 340  0028 4bc0          	push	#192
 341  002a 7b06          	ld	a,(OFST+6,sp)
 342  002c 88            	push	a
 343  002d 1e05          	ldw	x,(OFST+5,sp)
 344  002f cd0000        	call	_GPIO_Init
 346  0032 85            	popw	x
 347                     ; 28 }
 350  0033 81            	ret
 386                     ; 30 void Output10mhz_Init(sPin output)
 386                     ; 31 {
 387                     	switch	.text
 388  0034               _Output10mhz_Init:
 390       00000000      OFST:	set	0
 393                     ; 32 	GPIO_Init(output.Puerto, output.Pin, GPIO_MODE_OUT_PP_LOW_FAST);
 395  0034 4be0          	push	#224
 396  0036 7b06          	ld	a,(OFST+6,sp)
 397  0038 88            	push	a
 398  0039 1e05          	ldw	x,(OFST+5,sp)
 399  003b cd0000        	call	_GPIO_Init
 401  003e 85            	popw	x
 402                     ; 33 }
 405  003f 81            	ret
 441                     ; 35 void Output_0(sPin output)
 441                     ; 36 {
 442                     	switch	.text
 443  0040               _Output_0:
 445       00000000      OFST:	set	0
 448                     ; 37 	GPIO_WriteLow(output.Puerto, output.Pin);
 450  0040 7b05          	ld	a,(OFST+5,sp)
 451  0042 88            	push	a
 452  0043 1e04          	ldw	x,(OFST+4,sp)
 453  0045 cd0000        	call	_GPIO_WriteLow
 455  0048 84            	pop	a
 456                     ; 38 }
 459  0049 81            	ret
 495                     ; 40 void Output_1(sPin output)
 495                     ; 41 {
 496                     	switch	.text
 497  004a               _Output_1:
 499       00000000      OFST:	set	0
 502                     ; 42 	GPIO_WriteHigh(output.Puerto, output.Pin);
 504  004a 7b05          	ld	a,(OFST+5,sp)
 505  004c 88            	push	a
 506  004d 1e04          	ldw	x,(OFST+4,sp)
 507  004f cd0000        	call	_GPIO_WriteHigh
 509  0052 84            	pop	a
 510                     ; 43 }
 513  0053 81            	ret
 570                     ; 45 bool IsActive(sPin input)
 570                     ; 46 {
 571                     	switch	.text
 572  0054               _IsActive:
 574       00000000      OFST:	set	0
 577                     ; 47 	if(GPIO_ReadInputPin(input.Puerto, input.Pin)) return 1;
 579  0054 7b05          	ld	a,(OFST+5,sp)
 580  0056 88            	push	a
 581  0057 1e04          	ldw	x,(OFST+4,sp)
 582  0059 cd0000        	call	_GPIO_ReadInputPin
 584  005c 5b01          	addw	sp,#1
 585  005e 4d            	tnz	a
 586  005f 2703          	jreq	L552
 589  0061 a601          	ld	a,#1
 592  0063 81            	ret
 593  0064               L552:
 594                     ; 48 	else return 0;
 596  0064 4f            	clr	a
 599  0065 81            	ret
 644                     	xdef	_IsActive
 645                     	xdef	_Output_1
 646                     	xdef	_Output_0
 647                     	xdef	_Output10mhz_Init
 648                     	xdef	_Output2mhz_Init
 649                     	xdef	_Input_Init
 650                     	xdef	_Pin_Init
 651                     	switch	.ubsct
 652  0000               _Pulsador:
 653  0000 000000        	ds.b	3
 654                     	xdef	_Pulsador
 655  0003               _CCO:
 656  0003 000000        	ds.b	3
 657                     	xdef	_CCO
 658  0006               _Led:
 659  0006 000000        	ds.b	3
 660                     	xdef	_Led
 661                     	xref	_GPIO_ReadInputPin
 662                     	xref	_GPIO_WriteLow
 663                     	xref	_GPIO_WriteHigh
 664                     	xref	_GPIO_Init
 684                     	end
