; GENERATE A PRECISE 1 SECOND DELAY

	ORG	0000H
DELAY:
	MOV	R0, #8
L1:	MOV	R1, #249
L2:	MOV	R2, #249
	DJNZ	R2, $
	NOP
	DJNZ	R1, L2
	DJNZ	R0, L1

;1s 0ms 09us delay
	END
