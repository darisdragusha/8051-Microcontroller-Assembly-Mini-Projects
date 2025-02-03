; 4 7-segment CC displays connected to 4 ports of the microcontroller, show the numbers 1,2,3,4 and blink them T=2ms

	ORG	0000H
MAIN:
	MOV	P0, #06H	; CC 1
	MOV	P1, #5BH	; CC 2
	MOV	P2, #4FH	; CC 3
	MOV	P3, #66H	; CC 4
	ACALL	DELAY
	MOV	P0, #0
	MOV	P1, #0
	MOV	P2, #0
	MOV	P3, #0
	ACALL	DELAY
	SJMP	MAIN

DELAY:
	MOV	R0, #255
L1:
	NOP
	NOP
	DJNZ	R0, L1
	RET
	END
