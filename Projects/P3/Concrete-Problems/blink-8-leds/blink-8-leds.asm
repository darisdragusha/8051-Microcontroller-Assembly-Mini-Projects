
ORG 0000H          ; Start of program
MAIN:
    MOV P2, #0FFH  ; Configure P2 as output (all LEDs off initially, active high)

BLINK:
    MOV P2, #00H   ; Turn all LEDs ON
    ACALL DELAY_TON ; Wait for T_On

    MOV P2, #0FFH  ; Turn all LEDs OFF
    ACALL DELAY_TOFF ; Wait for T_Off

    SJMP BLINK     ; Repeat the loop

; Subroutine for T_On delay
DELAY_TON:
    MOV R0, #250   ; Example: T_On delay (approximation, adjust for clock freq)
TON_LOOP:
    DJNZ R0, TON_LOOP
    RET

; Subroutine for T_Off delay
DELAY_TOFF:
    MOV R1, #250   ; Example: T_Off delay (approximation, adjust for clock freq)
TOFF_LOOP:
    DJNZ R1, TOFF_LOOP
    RET

END                ; End of the program

