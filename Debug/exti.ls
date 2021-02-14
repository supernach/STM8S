   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 264                     ; 5 void Exti_Init(sPin pin, uint8_t prioridad, uint8_t flanco)
 264                     ; 6 {
 266                     	switch	.text
 267  0000               _Exti_Init:
 269  0000 89            	pushw	x
 270       00000002      OFST:	set	2
 273                     ; 8 	uint8_t iPrioridad = 0;
 275                     ; 10 	InputInt_Init(pin);
 277  0001 7b07          	ld	a,(OFST+5,sp)
 278  0003 88            	push	a
 279  0004 7b07          	ld	a,(OFST+5,sp)
 280  0006 88            	push	a
 281  0007 7b07          	ld	a,(OFST+5,sp)
 282  0009 88            	push	a
 283  000a cd0000        	call	_InputInt_Init
 285  000d 5b03          	addw	sp,#3
 286                     ; 11 	ITC_DeInit();
 288  000f cd0000        	call	_ITC_DeInit
 290                     ; 13 	port = ObtenerPuertoItc(pin.Puerto);
 292  0012 1e05          	ldw	x,(OFST+3,sp)
 293  0014 ad2b          	call	_ObtenerPuertoItc
 295  0016 6b02          	ld	(OFST+0,sp),a
 297                     ; 14 	iPrioridad = ObtenerPrioridad(prioridad);
 299  0018 7b08          	ld	a,(OFST+6,sp)
 300  001a cd00b4        	call	_ObtenerPrioridad
 302  001d 6b01          	ld	(OFST-1,sp),a
 304                     ; 16 	ITC_SetSoftwarePriority(port, iPrioridad);
 306  001f 7b01          	ld	a,(OFST-1,sp)
 307  0021 97            	ld	xl,a
 308  0022 7b02          	ld	a,(OFST+0,sp)
 309  0024 95            	ld	xh,a
 310  0025 cd0000        	call	_ITC_SetSoftwarePriority
 312                     ; 18 	EXTI_DeInit();
 314  0028 cd0000        	call	_EXTI_DeInit
 316                     ; 19 	port = ObtenerPuertoExti(pin.Puerto);
 318  002b 1e05          	ldw	x,(OFST+3,sp)
 319  002d ad4c          	call	_ObtenerPuertoExti
 321  002f 6b02          	ld	(OFST+0,sp),a
 323                     ; 20 	EXTI_SetExtIntSensitivity(port, flanco);
 325  0031 7b09          	ld	a,(OFST+7,sp)
 326  0033 97            	ld	xl,a
 327  0034 7b02          	ld	a,(OFST+0,sp)
 328  0036 95            	ld	xh,a
 329  0037 cd0000        	call	_EXTI_SetExtIntSensitivity
 331                     ; 21 	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 333  003a 4f            	clr	a
 334  003b cd0000        	call	_EXTI_SetTLISensitivity
 336                     ; 23 	enableInterrupts();
 339  003e 9a            rim
 341                     ; 24 }
 345  003f 85            	popw	x
 346  0040 81            	ret
 383                     ; 26 uint8_t ObtenerPuertoItc(GPIO_TypeDef* puerto)
 383                     ; 27 {
 384                     	switch	.text
 385  0041               _ObtenerPuertoItc:
 387  0041 89            	pushw	x
 388       00000000      OFST:	set	0
 391                     ; 29 	if(puerto == GPIOA)
 393  0042 a35000        	cpw	x,#20480
 394  0045 2604          	jrne	L761
 395                     ; 31 		return ITC_IRQ_PORTA;
 397  0047 a603          	ld	a,#3
 399  0049 2009          	jra	L01
 400  004b               L761:
 401                     ; 33 	else if(puerto == GPIOB)
 403  004b 1e01          	ldw	x,(OFST+1,sp)
 404  004d a35005        	cpw	x,#20485
 405  0050 2604          	jrne	L371
 406                     ; 35 		return ITC_IRQ_PORTB;
 408  0052 a604          	ld	a,#4
 410  0054               L01:
 412  0054 85            	popw	x
 413  0055 81            	ret
 414  0056               L371:
 415                     ; 37 	else if(puerto == GPIOC)
 417  0056 1e01          	ldw	x,(OFST+1,sp)
 418  0058 a3500a        	cpw	x,#20490
 419  005b 2604          	jrne	L771
 420                     ; 39 		return ITC_IRQ_PORTC;
 422  005d a605          	ld	a,#5
 424  005f 20f3          	jra	L01
 425  0061               L771:
 426                     ; 41 	else if(puerto == GPIOD)
 428  0061 1e01          	ldw	x,(OFST+1,sp)
 429  0063 a3500f        	cpw	x,#20495
 430  0066 2604          	jrne	L302
 431                     ; 43 		return ITC_IRQ_PORTD;
 433  0068 a606          	ld	a,#6
 435  006a 20e8          	jra	L01
 436  006c               L302:
 437                     ; 45 	else if(puerto == GPIOE)
 439  006c 1e01          	ldw	x,(OFST+1,sp)
 440  006e a35014        	cpw	x,#20500
 441  0071 2604          	jrne	L702
 442                     ; 47 		return ITC_IRQ_PORTE;
 444  0073 a607          	ld	a,#7
 446  0075 20dd          	jra	L01
 447  0077               L702:
 448                     ; 51 		return 100;
 450  0077 a664          	ld	a,#100
 452  0079 20d9          	jra	L01
 489                     ; 55 uint8_t ObtenerPuertoExti(GPIO_TypeDef* puerto)
 489                     ; 56 {
 490                     	switch	.text
 491  007b               _ObtenerPuertoExti:
 493  007b 89            	pushw	x
 494       00000000      OFST:	set	0
 497                     ; 57 	if(puerto == GPIOA)
 499  007c a35000        	cpw	x,#20480
 500  007f 2603          	jrne	L332
 501                     ; 59 		return EXTI_PORT_GPIOA;
 503  0081 4f            	clr	a
 505  0082 2009          	jra	L41
 506  0084               L332:
 507                     ; 61 	else if(puerto == GPIOB)
 509  0084 1e01          	ldw	x,(OFST+1,sp)
 510  0086 a35005        	cpw	x,#20485
 511  0089 2604          	jrne	L732
 512                     ; 63 		return EXTI_PORT_GPIOB;
 514  008b a601          	ld	a,#1
 516  008d               L41:
 518  008d 85            	popw	x
 519  008e 81            	ret
 520  008f               L732:
 521                     ; 65 	else if(puerto == GPIOC)
 523  008f 1e01          	ldw	x,(OFST+1,sp)
 524  0091 a3500a        	cpw	x,#20490
 525  0094 2604          	jrne	L342
 526                     ; 67 		return EXTI_PORT_GPIOC;
 528  0096 a602          	ld	a,#2
 530  0098 20f3          	jra	L41
 531  009a               L342:
 532                     ; 69 	else if(puerto == GPIOD)
 534  009a 1e01          	ldw	x,(OFST+1,sp)
 535  009c a3500f        	cpw	x,#20495
 536  009f 2604          	jrne	L742
 537                     ; 71 		return EXTI_PORT_GPIOD;
 539  00a1 a603          	ld	a,#3
 541  00a3 20e8          	jra	L41
 542  00a5               L742:
 543                     ; 73 	else if(puerto == GPIOE)
 545  00a5 1e01          	ldw	x,(OFST+1,sp)
 546  00a7 a35014        	cpw	x,#20500
 547  00aa 2604          	jrne	L352
 548                     ; 75 		return EXTI_PORT_GPIOE;
 550  00ac a604          	ld	a,#4
 552  00ae 20dd          	jra	L41
 553  00b0               L352:
 554                     ; 79 		return 100;
 556  00b0 a664          	ld	a,#100
 558  00b2 20d9          	jra	L41
 592                     ; 83 uint8_t ObtenerPrioridad(uint8_t prio)
 592                     ; 84 {
 593                     	switch	.text
 594  00b4               _ObtenerPrioridad:
 596  00b4 88            	push	a
 597       00000000      OFST:	set	0
 600                     ; 85 	if(prio == 0)
 602  00b5 4d            	tnz	a
 603  00b6 2605          	jrne	L572
 604                     ; 87 		return ITC_PRIORITYLEVEL_0;
 606  00b8 a602          	ld	a,#2
 609  00ba 5b01          	addw	sp,#1
 610  00bc 81            	ret
 611  00bd               L572:
 612                     ; 89 	else if(prio == 1)
 614  00bd 7b01          	ld	a,(OFST+1,sp)
 615  00bf a101          	cp	a,#1
 616  00c1 2605          	jrne	L103
 617                     ; 91 		return ITC_PRIORITYLEVEL_1;
 619  00c3 a601          	ld	a,#1
 622  00c5 5b01          	addw	sp,#1
 623  00c7 81            	ret
 624  00c8               L103:
 625                     ; 93 	else if(prio == 2)
 627  00c8 7b01          	ld	a,(OFST+1,sp)
 628  00ca a102          	cp	a,#2
 629  00cc 2604          	jrne	L503
 630                     ; 95 		return ITC_PRIORITYLEVEL_2;
 632  00ce 4f            	clr	a
 635  00cf 5b01          	addw	sp,#1
 636  00d1 81            	ret
 637  00d2               L503:
 638                     ; 97 	else if(prio == 3)
 640  00d2 7b01          	ld	a,(OFST+1,sp)
 641  00d4 a103          	cp	a,#3
 642  00d6 2605          	jrne	L113
 643                     ; 99 		return ITC_PRIORITYLEVEL_3;
 645  00d8 a603          	ld	a,#3
 648  00da 5b01          	addw	sp,#1
 649  00dc 81            	ret
 650  00dd               L113:
 651                     ; 103 		return 100;
 653  00dd a664          	ld	a,#100
 656  00df 5b01          	addw	sp,#1
 657  00e1 81            	ret
 670                     	xdef	_ObtenerPrioridad
 671                     	xdef	_ObtenerPuertoExti
 672                     	xdef	_ObtenerPuertoItc
 673                     	xdef	_Exti_Init
 674                     	xref	_InputInt_Init
 675                     	xref	_ITC_SetSoftwarePriority
 676                     	xref	_ITC_DeInit
 677                     	xref	_EXTI_SetTLISensitivity
 678                     	xref	_EXTI_SetExtIntSensitivity
 679                     	xref	_EXTI_DeInit
 698                     	end
