

ORG 0000H          ; Program start
MAIN:
    MOV A, #80H    ; Initialize shift register with preset value
    MOV P1, #00H   ; Configure P1 as input
    MOV P2, A      ; Output initial state to LEDs

RIGHT_SHIFT:
    JB P1.3, LOAD_PRESET ; Check load preset signal
    JNB P1.1, RIGHT_SHIFT ; Wait for clock signal
    RR A                ; Perform right shift
    MOV P2, A           ; Output shift register state to LEDs
    SJMP RIGHT_SHIFT    ; Repeat

LOAD_PRESET:
    MOV A, #80H    ; Load preset value
    MOV P2, A      ; Output preset value
    SJMP RIGHT_SHIFT
END

