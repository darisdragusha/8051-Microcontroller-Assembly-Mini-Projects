
ORG 0000H          ; Program start
MAIN:
    MOV A, #00H    ; Initialize shift register to 0
    MOV P1, #00H   ; Configure P1 as input
    MOV P2, A      ; Output initial state to LEDs

SIPO_LOOP:
    JNB P1.1, SIPO_LOOP ; Wait for clock signal
    MOV C, P1.0         ; Read serial input to carry bit
    RLC A               ; Rotate left through carry
    MOV P2, A           ; Output parallel data to LEDs
    SJMP SIPO_LOOP      ; Repeat
END

