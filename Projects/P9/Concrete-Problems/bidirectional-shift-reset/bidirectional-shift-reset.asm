

ORG 0000H          ; Program start
MAIN:
    MOV A, #81H    ; Initialize shift register with preset value
    MOV P1, #00H   ; Configure P1 as input
    MOV P2, A      ; Output initial state to LEDs

BIDIR_SHIFT:
    JB P1.3, RESET ; Check reset signal
    JNB P1.1, BIDIR_SHIFT ; Wait for clock signal
    JB P1.4, SHIFT_LEFT   ; Check shift direction
    RR A                 ; Perform right shift
    SJMP UPDATE_OUTPUT

SHIFT_LEFT:
    RL A                 ; Perform left shift

UPDATE_OUTPUT:
    MOV P2, A            ; Output shift register state to LEDs
    SJMP BIDIR_SHIFT     ; Repeat

RESET:
    MOV A, #81H    ; Reset shift register
    MOV P2, A      ; Output reset state
    SJMP BIDIR_SHIFT
END

