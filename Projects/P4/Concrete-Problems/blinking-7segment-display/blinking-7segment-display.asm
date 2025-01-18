

ORG 0000H          ; Start of program
MAIN:
    MOV P1, #0FFH  ; Configure P1 as output (all segments off initially, CA)

BLINK:
    MOV P1, #03H   ; Display "7" on 7-segment (CA, active low)
    ACALL DELAY_TON ; Wait for T_On

    MOV P1, #0FFH  ; Turn off all segments
    ACALL DELAY_TOFF ; Wait for T_Off

    SJMP BLINK     ; Repeat the loop

; Subroutine for T_On delay
DELAY_TON:
    MOV R0, #250   ; Example delay for T_On (adjust as needed)
TON_LOOP:
    DJNZ R0, TON_LOOP
    RET

; Subroutine for T_Off delay
DELAY_TOFF:
    MOV R1, #250   ; Example delay for T_Off (adjust as needed)
TOFF_LOOP:
    DJNZ R1, TOFF_LOOP
    RET

END

