   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
 219                     ; 5 void Input_Init(sPin input)
 219                     ; 6 {
 221                     	switch	.text
 222  0000               _Input_Init:
 224       00000000      OFST:	set	0
 227                     ; 7 	GPIO_Init(input.Puerto, input.Pin, GPIO_MODE_IN_PU_NO_IT);
 229  0000 4b40          	push	#64
 230  0002 7b06          	ld	a,(OFST+6,sp)
 231  0004 88            	push	a
 232  0005 1e05          	ldw	x,(OFST+5,sp)
 233  0007 cd0000        	call	_GPIO_Init
 235  000a 85            	popw	x
 236                     ; 8 }
 239  000b 81            	ret
 275                     ; 10 void Output2mhz_Init(sPin output)
 275                     ; 11 {
 276                     	switch	.text
 277  000c               _Output2mhz_Init:
 279       00000000      OFST:	set	0
 282                     ; 12 	GPIO_Init(output.Puerto, output.Pin, GPIO_MODE_OUT_PP_LOW_SLOW);
 284  000c 4bc0          	push	#192
 285  000e 7b06          	ld	a,(OFST+6,sp)
 286  0010 88            	push	a
 287  0011 1e05          	ldw	x,(OFST+5,sp)
 288  0013 cd0000        	call	_GPIO_Init
 290  0016 85            	popw	x
 291                     ; 13 }
 294  0017 81            	ret
 330                     ; 15 void Output10mhz_Init(sPin output)
 330                     ; 16 {
 331                     	switch	.text
 332  0018               _Output10mhz_Init:
 334       00000000      OFST:	set	0
 337                     ; 17 	GPIO_Init(output.Puerto, output.Pin, GPIO_MODE_OUT_PP_LOW_FAST);
 339  0018 4be0          	push	#224
 340  001a 7b06          	ld	a,(OFST+6,sp)
 341  001c 88            	push	a
 342  001d 1e05          	ldw	x,(OFST+5,sp)
 343  001f cd0000        	call	_GPIO_Init
 345  0022 85            	popw	x
 346                     ; 18 }
 349  0023 81            	ret
 385                     ; 20 void Output_0(sPin output)
 385                     ; 21 {
 386                     	switch	.text
 387  0024               _Output_0:
 389       00000000      OFST:	set	0
 392                     ; 22 	GPIO_WriteLow(output.Puerto, output.Pin);
 394  0024 7b05          	ld	a,(OFST+5,sp)
 395  0026 88            	push	a
 396  0027 1e04          	ldw	x,(OFST+4,sp)
 397  0029 cd0000        	call	_GPIO_WriteLow
 399  002c 84            	pop	a
 400                     ; 23 }
 403  002d 81            	ret
 439                     ; 25 void Output_1(sPin output)
 439                     ; 26 {
 440                     	switch	.text
 441  002e               _Output_1:
 443       00000000      OFST:	set	0
 446                     ; 27 	GPIO_WriteHigh(output.Puerto, output.Pin);
 448  002e 7b05          	ld	a,(OFST+5,sp)
 449  0030 88            	push	a
 450  0031 1e04          	ldw	x,(OFST+4,sp)
 451  0033 cd0000        	call	_GPIO_WriteHigh
 453  0036 84            	pop	a
 454                     ; 28 }
 457  0037 81            	ret
 514                     ; 30 bool IsActive(sPin input)
 514                     ; 31 {
 515                     	switch	.text
 516  0038               _IsActive:
 518       00000000      OFST:	set	0
 521                     ; 32 	if(GPIO_ReadInputPin(input.Puerto, input.Pin)) return 1;
 523  0038 7b05          	ld	a,(OFST+5,sp)
 524  003a 88            	push	a
 525  003b 1e04          	ldw	x,(OFST+4,sp)
 526  003d cd0000        	call	_GPIO_ReadInputPin
 528  0040 5b01          	addw	sp,#1
 529  0042 4d            	tnz	a
 530  0043 2703          	jreq	L542
 533  0045 a601          	ld	a,#1
 536  0047 81            	ret
 537  0048               L542:
 538                     ; 33 	else return 0;
 540  0048 4f            	clr	a
 543  0049 81            	ret
 556                     	xdef	_IsActive
 557                     	xdef	_Output_1
 558                     	xdef	_Output_0
 559                     	xdef	_Output10mhz_Init
 560                     	xdef	_Output2mhz_Init
 561                     	xdef	_Input_Init
 562                     	xref	_GPIO_ReadInputPin
 563                     	xref	_GPIO_WriteLow
 564                     	xref	_GPIO_WriteHigh
 565                     	xref	_GPIO_Init
 584                     	end
