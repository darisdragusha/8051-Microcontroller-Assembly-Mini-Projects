; UP/ DOWN BCD COUNTER
; UP = P1.0 HIGH, DOWN = P1.0 LOW
; P1.1 = CLK 
	ORG	0000H
COUNTER	EQU	30H
MAIN:
	JNB	P1.1, $
	JNB	P1.0, DOWN_COUNT
	SJMP	UP_COUNT

UP_COUNT:
	MOV	A, COUNTER
	ADD	A, #01H
	DA	A
	MOV	COUNTER, A
	CJNE	A, #100, COUNT_UP_DONE
	MOV	COUNTER, #00H
COUNT_UP_DONE:
	SJMP	MAIN

DOWN_COUNT:
	MOV	A, COUNTER
	SUBB	A, #01H
	DA	A
	MOV	COUNTER, A
	CJNE	A, #0FFH, COUNT_DOWN_DONE
	MOV	COUNTER, #99H
COUNT_DOWN_DONE:
	SJMP	MAIN



