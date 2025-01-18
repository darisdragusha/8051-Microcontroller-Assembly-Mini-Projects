

ORG 0000H          ; Start of program
MAIN:
    MOV P2, #00H   ; Configure P2 as output

BLINK:
    MOV P2, #AAH   ; Alternate pattern 1 (10101010B)
    ACALL DELAY_TPERIOD ; Wait for T_Period

    MOV P2, #55H   ; Alternate pattern 2 (01010101B)
    ACALL DELAY_TPERIOD ; Wait for T_Period

    SJMP BLINK     ; Repeat the loop

; Subroutine for T_Period delay
DELAY_TPERIOD:
    MOV R0, #250   ; Example: T_Period delay
TPERIOD_LOOP:
    DJNZ R0, TPERIOD_LOOP
    RET

END                ; End of the program
