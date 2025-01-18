

ORG 0000H              ; Program start

MAIN:
    MOV P1, #FFH       ; Configure P1 as input
    MOV P2, #00H       ; Configure P2 as output

READ_KEYS:
    MOV A, P1          ; Read keypress state
    CJNE A, #FFH, CHECK_KEYS ; Check if no keys are pressed
    CLR P2             ; Turn off display if no keys are pressed
    SJMP READ_KEYS     ; Repeat reading keys

CHECK_KEYS:
    MOV B, A           ; Copy keypress state to B
    MOV C, #00H        ; Initialize count of pressed keys

COUNT_KEYS:
    RRC B              ; Rotate right to check each bit
    JC INCREMENT_COUNT ; Increment if bit is set
    DJNZ R7, COUNT_KEYS ; Decrement loop counter and repeat

INCREMENT_COUNT:
    INC C              ; Increment pressed keys count
    MOV A, C
    CJNE A, #01H, MULTIPLE_KEYS ; Check if multiple keys pressed
    MOV P2, A          ; Display single keypress
    SJMP READ_KEYS     ; Continue reading

MULTIPLE_KEYS:
    MOV P2, #-         ; Display minus sign (assume encoding)
    SJMP READ_KEYS     ; Continue reading

END

