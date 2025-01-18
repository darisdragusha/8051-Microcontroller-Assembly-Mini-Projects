

ORG 0000H          ; Program start
MAIN:
    MOV P2, #FFH   ; Configure P2 as input (DIP switches)
    MOV P1, #00H   ; Configure P1 as input

PISO_LOOP:
    JNB P1.2, SHIFT_OUT ; Check load signal
    MOV A, P2           ; Load parallel data into shift register

SHIFT_OUT:
    JNB P1.1, SHIFT_OUT ; Wait for clock signal
    RRC A               ; Rotate right through carry
    MOV P1.0, C         ; Output carry bit as serial data
    SJMP PISO_LOOP      ; Repeat
END

