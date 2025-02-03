; LED1 - TON = 250US, TOFF=250US
; LED2 - TON = 500Us, TOFF=500Us
; LED1 - TON = 1ms, TOFF=1ms
; REPEAT IF P1.0 AND NOT P1.1
; LED1 ONLY TURNS ON IF P1.2 IS HIGH
	ORG	0000H
	LJMP	INIT
	ORG	000BH
	LJMP	T0ISR
LED1	EQU	P2.0
LED2	EQU	P2.1
LED3	EQU	P2.2

INIT:
	MOV	TMOD, #01H
	MOV	TH0, #(-250D)	; -250D
	MOV	R2, #2
	MOV	R3, #4
MAIN:
	MOV	C, P1.2
	MOV	0, C
	MOV	C, P1.1
	CPL	C
	ANL	C, P1.0
	MOV	1, C
	MOV	R2, #2		; 
	MOV	R3, #3		; 
	SETB	TR0
	JNB	0, SKIP_LED1
	SETB	LED1
SKIP_LED1:
	SETB	LED2
	SETB	LED3
	CLR C 
	JNC	$
	SJMP	MAIN

T0ISR:
	JNB	0, SKIP_LED1_CPL
	CPL	LED1
SKIP_LED1_CPL:
	DJNZ	R2, CHECK_LED3
	CPL	LED2
	MOV	R2, #2
CHECK_LED3:
	DJNZ	R3, SKIP_LED3
	CPL	LED3
	MOV	R3, #3
	JNB	1, SKIP_LED3
	SETB	C
SKIP_LED3:
	CLR	C
	RET

	END

