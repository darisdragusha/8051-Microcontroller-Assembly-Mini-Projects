

ORG 0000H          ; Program start
MAIN:
    MOV A, #01H    ; Initialize shift register with LSB = 1
    MOV P1, #00H   ; Configure P1 as input
    MOV P2, A      ; Output initial state to LEDs
LEFT_SHIFT:
    JB P1.3, RESET ; Check reset signal
    JNB P1.1, LEFT_SHIFT ; Wait for clock signal
    RL A               ; Perform left shift
    MOV P2, A          ; Output shift register state to LEDs
    SJMP LEFT_SHIFT    ; Repeat

RESET:
    MOV A, #01H    ; Reset shift register
    MOV P2, A      ; Output reset state
    SJMP LEFT_SHIFT
END

