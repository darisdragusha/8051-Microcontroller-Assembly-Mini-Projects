

ORG 0000H          ; Start of program
MAIN:
    MOV P1, #0FFH  ; Configure P1 as input (set all pins high to read switches)
    MOV P2, #00H   ; Configure P2 as output (clear output pins)

    MOV A, P1      ; Read the input values from port P1
    ANL A, #03H    ; Mask only P1.0 and P1.1 (bitwise AND with 00000011B)
    XRL A, A       ; Perform XOR operation
    MOV R0, A      ; Store XOR result in R0
    JB P1.2, RESET ; If P1.2 (reset button) is high, jump to RESET

    MOV A, R0      ; Load XOR result back
    CJNE A, #01H, LED_OFF ; If XOR result is not 1, turn off LED

LED_ON:
    SETB P2.0      ; Turn on LED connected to P2.0
    SJMP MAIN      ; Repeat the loop

LED_OFF:
    CLR P2.0       ; Turn off LED connected to P2.0
    SJMP MAIN      ; Repeat the loop

RESET:
    CLR P2.0       ; Clear LED and reset computation
    SJMP MAIN      ; Repeat the loop

END                ; End of the program
