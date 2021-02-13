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
 331                     ; 25 void InputInt_Init(sPin input)
 331                     ; 26 {
 332                     	switch	.text
 333  0028               _InputInt_Init:
 335       00000000      OFST:	set	0
 338                     ; 27 	GPIO_Init(input.Puerto, input.Pin, GPIO_MODE_IN_PU_IT);
 340  0028 4b60          	push	#96
 341  002a 7b06          	ld	a,(OFST+6,sp)
 342  002c 88            	push	a
 343  002d 1e05          	ldw	x,(OFST+5,sp)
 344  002f cd0000        	call	_GPIO_Init
 346  0032 85            	popw	x
 347                     ; 28 }
 350  0033 81            	ret
 386                     ; 30 void Output2mhz_Init(sPin output)
 386                     ; 31 {
 387                     	switch	.text
 388  0034               _Output2mhz_Init:
 390       00000000      OFST:	set	0
 393                     ; 32 	GPIO_Init(output.Puerto, output.Pin, GPIO_MODE_OUT_PP_LOW_SLOW);
 395  0034 4bc0          	push	#192
 396  0036 7b06          	ld	a,(OFST+6,sp)
 397  0038 88            	push	a
 398  0039 1e05          	ldw	x,(OFST+5,sp)
 399  003b cd0000        	call	_GPIO_Init
 401  003e 85            	popw	x
 402                     ; 33 }
 405  003f 81            	ret
 441                     ; 35 void Output10mhz_Init(sPin output)
 441                     ; 36 {
 442                     	switch	.text
 443  0040               _Output10mhz_Init:
 445       00000000      OFST:	set	0
 448                     ; 37 	GPIO_Init(output.Puerto, output.Pin, GPIO_MODE_OUT_PP_LOW_FAST);
 450  0040 4be0          	push	#224
 451  0042 7b06          	ld	a,(OFST+6,sp)
 452  0044 88            	push	a
 453  0045 1e05          	ldw	x,(OFST+5,sp)
 454  0047 cd0000        	call	_GPIO_Init
 456  004a 85            	popw	x
 457                     ; 38 }
 460  004b 81            	ret
 496                     ; 40 void Output_0(sPin output)
 496                     ; 41 {
 497                     	switch	.text
 498  004c               _Output_0:
 500       00000000      OFST:	set	0
 503                     ; 42 	GPIO_WriteLow(output.Puerto, output.Pin);
 505  004c 7b05          	ld	a,(OFST+5,sp)
 506  004e 88            	push	a
 507  004f 1e04          	ldw	x,(OFST+4,sp)
 508  0051 cd0000        	call	_GPIO_WriteLow
 510  0054 84            	pop	a
 511                     ; 43 }
 514  0055 81            	ret
 550                     ; 45 void Output_1(sPin output)
 550                     ; 46 {
 551                     	switch	.text
 552  0056               _Output_1:
 554       00000000      OFST:	set	0
 557                     ; 47 	GPIO_WriteHigh(output.Puerto, output.Pin);
 559  0056 7b05          	ld	a,(OFST+5,sp)
 560  0058 88            	push	a
 561  0059 1e04          	ldw	x,(OFST+4,sp)
 562  005b cd0000        	call	_GPIO_WriteHigh
 564  005e 84            	pop	a
 565                     ; 48 }
 568  005f 81            	ret
 625                     ; 50 bool IsActive(sPin input)
 625                     ; 51 {
 626                     	switch	.text
 627  0060               _IsActive:
 629       00000000      OFST:	set	0
 632                     ; 52 	if(GPIO_ReadInputPin(input.Puerto, input.Pin)) return 1;
 634  0060 7b05          	ld	a,(OFST+5,sp)
 635  0062 88            	push	a
 636  0063 1e04          	ldw	x,(OFST+4,sp)
 637  0065 cd0000        	call	_GPIO_ReadInputPin
 639  0068 5b01          	addw	sp,#1
 640  006a 4d            	tnz	a
 641  006b 2703          	jreq	L372
 644  006d a601          	ld	a,#1
 647  006f 81            	ret
 648  0070               L372:
 649                     ; 53 	else return 0;
 651  0070 4f            	clr	a
 654  0071 81            	ret
 699                     	xdef	_IsActive
 700                     	xdef	_Output_1
 701                     	xdef	_Output_0
 702                     	xdef	_Output10mhz_Init
 703                     	xdef	_Output2mhz_Init
 704                     	xdef	_InputInt_Init
 705                     	xdef	_Input_Init
 706                     	xdef	_Pin_Init
 707                     	switch	.ubsct
 708  0000               _Pulsador:
 709  0000 000000        	ds.b	3
 710                     	xdef	_Pulsador
 711  0003               _CCO:
 712  0003 000000        	ds.b	3
 713                     	xdef	_CCO
 714  0006               _Led:
 715  0006 000000        	ds.b	3
 716                     	xdef	_Led
 717                     	xref	_GPIO_ReadInputPin
 718                     	xref	_GPIO_WriteLow
 719                     	xref	_GPIO_WriteHigh
 720                     	xref	_GPIO_Init
 740                     	end
