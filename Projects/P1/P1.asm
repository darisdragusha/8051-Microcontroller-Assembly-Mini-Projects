	ORG	0000H

X1	EQU	P1.0
X2	EQU	P1.1
X3	EQU	P1.2
X4	EQU	P1.4

LED	EQU	P2.0

MAIN:
	MOV	C, X1
	ORL	C, X2
	MOV	ACC.0, C
	MOV	C, X4
	ANL	C, X3
	CPL	C
	ANL	C, ACC.0
	MOV	LED, C

	END


