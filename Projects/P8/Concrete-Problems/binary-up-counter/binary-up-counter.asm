

ORG 0000H          ; Program start
MAIN:
    MOV A, #00H    ; Initialize counter to 0
    MOV P2, A      ; Output counter state to LEDs
    MOV P1, #00H   ; Configure P1 as input for control signal

UP_COUNTER:
    JNB P1.0, UP_COUNTER ; Wait for P1.0 to go high
    INC A                ; Increment counter
    MOV P2, A            ; Output counter state to LEDs
    SJMP UP_COUNTER      ; Repeat
END

