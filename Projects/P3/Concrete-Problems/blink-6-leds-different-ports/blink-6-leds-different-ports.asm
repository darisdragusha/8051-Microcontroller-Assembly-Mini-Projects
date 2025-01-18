

ORG 0000H          ; Start of program
MAIN:
    MOV P1, #00H   ; Configure P1 as output (all LEDs off initially)
    MOV P3, #00H   ; Configure P3 as output (all LEDs off initially)

BLINK:
    MOV P1, #FFH   ; Turn 4 LEDs ON (on P1)
    MOV P3, #0F0H  ; Turn 2 LEDs ON (on P3)
    ACALL DELAY_TON ; Wait for T_Period - T_Off

    MOV P1, #00H   ; Turn 4 LEDs OFF
    MOV P3, #00H   ; Turn 2 LEDs OFF
    ACALL DELAY_TOFF ; Wait for T_Off

    SJMP BLINK     ; Repeat the loop

; Subroutine for T_Period - T_Off delay
DELAY_TON:
    MOV R0, #180   ; Example: T_Period - T_Off delay
TON_LOOP:
    DJNZ R0, TON_LOOP
    RET

; Subroutine for T_Off delay
DELAY_TOFF:
    MOV R1, #70    ; Example: T_Off delay
TOFF_LOOP:
    DJNZ R1, TOFF_LOOP
    RET

END                ; End of the program

