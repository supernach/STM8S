   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
  46                     ; 9 void Pin_Init(void)
  46                     ; 10 {
  48                     	switch	.text
  49  0000               _Pin_Init:
  53                     ; 11 	Led.Puerto = GPIOB;
  55  0000 ae5005        	ldw	x,#20485
  56  0003 bf09          	ldw	_Led,x
  57                     ; 12 	Led.Pin = GPIO_PIN_5;
  59  0005 3520000b      	mov	_Led+2,#32
  60                     ; 14 	Pulsador.Puerto = GPIOD;
  62  0009 ae500f        	ldw	x,#20495
  63  000c bf03          	ldw	_Pulsador,x
  64                     ; 15 	Pulsador.Pin = GPIO_PIN_5;
  66  000e 35200005      	mov	_Pulsador+2,#32
  67                     ; 17 	CCO.Puerto = GPIOC;
  69  0012 ae500a        	ldw	x,#20490
  70  0015 bf06          	ldw	_CCO,x
  71                     ; 18 	CCO.Pin = GPIO_PIN_4;
  73  0017 35100008      	mov	_CCO+2,#16
  74                     ; 20 	BotonIT.Puerto = GPIOD;
  76  001b ae500f        	ldw	x,#20495
  77  001e bf00          	ldw	_BotonIT,x
  78                     ; 21 	BotonIT.Pin = GPIO_PIN_3;
  80  0020 35080002      	mov	_BotonIT+2,#8
  81                     ; 22 }
  84  0024 81            	ret
 284                     ; 24 void Input_Init(sPin input)
 284                     ; 25 {
 285                     	switch	.text
 286  0025               _Input_Init:
 288       00000000      OFST:	set	0
 291                     ; 26 	GPIO_Init(input.Puerto, input.Pin, GPIO_MODE_IN_PU_NO_IT);
 293  0025 4b40          	push	#64
 294  0027 7b06          	ld	a,(OFST+6,sp)
 295  0029 88            	push	a
 296  002a 1e05          	ldw	x,(OFST+5,sp)
 297  002c cd0000        	call	_GPIO_Init
 299  002f 85            	popw	x
 300                     ; 27 }
 303  0030 81            	ret
 339                     ; 29 void InputInt_Init(sPin input)
 339                     ; 30 {
 340                     	switch	.text
 341  0031               _InputInt_Init:
 343       00000000      OFST:	set	0
 346                     ; 31 	GPIO_Init(input.Puerto, input.Pin, GPIO_MODE_IN_PU_IT);
 348  0031 4b60          	push	#96
 349  0033 7b06          	ld	a,(OFST+6,sp)
 350  0035 88            	push	a
 351  0036 1e05          	ldw	x,(OFST+5,sp)
 352  0038 cd0000        	call	_GPIO_Init
 354  003b 85            	popw	x
 355                     ; 32 }
 358  003c 81            	ret
 394                     ; 34 void Output2mhz_Init(sPin output)
 394                     ; 35 {
 395                     	switch	.text
 396  003d               _Output2mhz_Init:
 398       00000000      OFST:	set	0
 401                     ; 36 	GPIO_Init(output.Puerto, output.Pin, GPIO_MODE_OUT_PP_LOW_SLOW);
 403  003d 4bc0          	push	#192
 404  003f 7b06          	ld	a,(OFST+6,sp)
 405  0041 88            	push	a
 406  0042 1e05          	ldw	x,(OFST+5,sp)
 407  0044 cd0000        	call	_GPIO_Init
 409  0047 85            	popw	x
 410                     ; 37 }
 413  0048 81            	ret
 449                     ; 39 void Output10mhz_Init(sPin output)
 449                     ; 40 {
 450                     	switch	.text
 451  0049               _Output10mhz_Init:
 453       00000000      OFST:	set	0
 456                     ; 41 	GPIO_Init(output.Puerto, output.Pin, GPIO_MODE_OUT_PP_LOW_FAST);
 458  0049 4be0          	push	#224
 459  004b 7b06          	ld	a,(OFST+6,sp)
 460  004d 88            	push	a
 461  004e 1e05          	ldw	x,(OFST+5,sp)
 462  0050 cd0000        	call	_GPIO_Init
 464  0053 85            	popw	x
 465                     ; 42 }
 468  0054 81            	ret
 504                     ; 44 void Output_0(sPin output)
 504                     ; 45 {
 505                     	switch	.text
 506  0055               _Output_0:
 508       00000000      OFST:	set	0
 511                     ; 46 	GPIO_WriteLow(output.Puerto, output.Pin);
 513  0055 7b05          	ld	a,(OFST+5,sp)
 514  0057 88            	push	a
 515  0058 1e04          	ldw	x,(OFST+4,sp)
 516  005a cd0000        	call	_GPIO_WriteLow
 518  005d 84            	pop	a
 519                     ; 47 }
 522  005e 81            	ret
 558                     ; 49 void Output_1(sPin output)
 558                     ; 50 {
 559                     	switch	.text
 560  005f               _Output_1:
 562       00000000      OFST:	set	0
 565                     ; 51 	GPIO_WriteHigh(output.Puerto, output.Pin);
 567  005f 7b05          	ld	a,(OFST+5,sp)
 568  0061 88            	push	a
 569  0062 1e04          	ldw	x,(OFST+4,sp)
 570  0064 cd0000        	call	_GPIO_WriteHigh
 572  0067 84            	pop	a
 573                     ; 52 }
 576  0068 81            	ret
 633                     ; 54 bool IsActive(sPin input)
 633                     ; 55 {
 634                     	switch	.text
 635  0069               _IsActive:
 637       00000000      OFST:	set	0
 640                     ; 56 	if(GPIO_ReadInputPin(input.Puerto, input.Pin)) return 1;
 642  0069 7b05          	ld	a,(OFST+5,sp)
 643  006b 88            	push	a
 644  006c 1e04          	ldw	x,(OFST+4,sp)
 645  006e cd0000        	call	_GPIO_ReadInputPin
 647  0071 5b01          	addw	sp,#1
 648  0073 4d            	tnz	a
 649  0074 2703          	jreq	L372
 652  0076 a601          	ld	a,#1
 655  0078 81            	ret
 656  0079               L372:
 657                     ; 57 	else return 0;
 659  0079 4f            	clr	a
 662  007a 81            	ret
 717                     	xdef	_IsActive
 718                     	xdef	_Output_1
 719                     	xdef	_Output_0
 720                     	xdef	_Output10mhz_Init
 721                     	xdef	_Output2mhz_Init
 722                     	xdef	_InputInt_Init
 723                     	xdef	_Input_Init
 724                     	xdef	_Pin_Init
 725                     	switch	.ubsct
 726  0000               _BotonIT:
 727  0000 000000        	ds.b	3
 728                     	xdef	_BotonIT
 729  0003               _Pulsador:
 730  0003 000000        	ds.b	3
 731                     	xdef	_Pulsador
 732  0006               _CCO:
 733  0006 000000        	ds.b	3
 734                     	xdef	_CCO
 735  0009               _Led:
 736  0009 000000        	ds.b	3
 737                     	xdef	_Led
 738                     	xref	_GPIO_ReadInputPin
 739                     	xref	_GPIO_WriteLow
 740                     	xref	_GPIO_WriteHigh
 741                     	xref	_GPIO_Init
 761                     	end
