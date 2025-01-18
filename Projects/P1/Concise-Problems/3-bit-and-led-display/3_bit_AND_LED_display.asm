

ORG 0000H          ; Start of program
MAIN:
    MOV P1, #0FFH  ; Configure P1 as input (set all pins high to read switches)
    MOV P2, #00H   ; Configure P2 as output (clear output pins)

    MOV A, P1      ; Read the input values from port P1
    ANL A, #07H    ; Mask only P1.0, P1.1, and P1.2 (bitwise AND with 00000111B)
    CJNE A, #07H, LED_OFF ; Compare with 07H (111 in binary). If not all high, turn off LED

LED_ON:
    SETB P2.0      ; Turn on LED connected to P2.0
    SJMP MAIN      ; Repeat the loop

LED_OFF:
    CLR P2.0       ; Turn off LED connected to P2.0
    SJMP MAIN      ; Repeat the loop

END                ; End of the program

