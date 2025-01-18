

ORG 0000H          ; Start of program
MAIN:
    MOV P2, #0FFH  ; Configure P2 as output (all segments off initially)
    MOV P3, #0FFH  ; Configure P3 as output (all segments off initially)

BLINK:
    ; Display "1" on P2 and turn off P3
    MOV P2, #0F9H  ; Display "1" on P2 (CC)
    MOV P3, #0FFH  ; Turn off P3
    ACALL DELAY_TPERIOD ; Wait for T_Period

    ; Display "4" on P3 and turn off P2
    MOV P2, #0FFH  ; Turn off P2
    MOV P3, #099H  ; Display "4" on P3 (CC)
    ACALL DELAY_TPERIOD ; Wait for T_Period

    SJMP BLINK     ; Repeat the loop

; Subroutine for T_Period delay
DELAY_TPERIOD:
    MOV R0, #500   ; Example delay for T_Period
TPERIOD_LOOP:
    DJNZ R0, TPERIOD_LOOP
    RET

END

