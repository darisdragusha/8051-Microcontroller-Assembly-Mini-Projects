

ORG 0000H          ; Start of program
MAIN:
    MOV P1, #0FFH  ; Configure P1 as input (set all pins high to read switches)
    MOV P3, #0FFH  ; Configure P3 as input
    MOV P2, #00H   ; Configure P2 as output (clear output pins)

    MOV A, P1      ; Read first 8-bit input from port P1
    ANL A, P3      ; Perform logical AND with second input from port P3
    MOV P2, A      ; Send the 8-bit result to port P2 (display on LEDs)
    SJMP MAIN      ; Repeat the loop

END                ; End of the program

