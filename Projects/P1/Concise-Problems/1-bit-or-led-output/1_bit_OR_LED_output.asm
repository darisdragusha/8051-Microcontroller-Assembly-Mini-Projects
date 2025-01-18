
; Define ports
IN1      EQU P1.1      ; Input 1
IN2      EQU P1.2      ; Input 2
OUT      EQU P1.0      ; Output

; Start of the program
        ORG 0000H      ; Program starts at address 0
        MOV P1, #0FFH  ; Set P1 as input for switches

MAIN:
        MOV C, IN1     ; Read IN1 to carry bit
        ORL C, IN2     ; Perform logical OR with IN2
        MOV OUT, C     ; Move result to output pin P1.0

        SJMP MAIN      ; Repeat indefinitely

        END            ; End of program

