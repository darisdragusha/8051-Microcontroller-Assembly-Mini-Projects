

ORG 0000H          ; Start of program
MAIN:
    MOV P1, #0FFH  ; Configure P1 as input (set all pins high to read switches)
    MOV P2, #00H   ; Configure P2 as output (clear output pins)

    MOV A, P1      ; Read the input values from port P1
    ANL A, #07H    ; Mask only P1.0, P1.1, and P1.2 (bitwise AND with 00000111B)
    ORL A, A       ; Perform logical OR operation on masked bits
    JZ DISPLAY_0   ; If result is 0, jump to display 0

DISPLAY_1:
    MOV P2, #06H   ; Light up segment `b` (CA for 1: 00000110B)
    SJMP MAIN      ; Repeat the loop

DISPLAY_0:
    MOV P2, #00H   ; Turn off all segments (CA for 0: 00000000B)
    SJMP MAIN      ; Repeat the loop

END                ; End of the program

