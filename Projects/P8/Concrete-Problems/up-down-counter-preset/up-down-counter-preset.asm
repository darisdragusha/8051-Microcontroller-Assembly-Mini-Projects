

ORG 0000H          ; Program start
MAIN:
    MOV R6, #50H   ; Initialize counter with preset value
    MOV P3, R6     ; Output counter state to LEDs
    MOV P1, #00H   ; Configure P1 as input

UP_DOWN_COUNTER:
    JNB P1.3, CHECK_DIRECTION ; Check preset signal
    MOV R6, #50H              ; Load preset value
    MOV P3, R6                ; Output counter state
CHECK_DIRECTION:
    JNB P1.2, COUNT_DOWN      ; Check direction (P1.2)
    INC R6                    ; Increment counter
    SJMP UPDATE_DISPLAY
COUNT_DOWN:
    DEC R6                    ; Decrement counter
UPDATE_DISPLAY:
    MOV P3, R6                ; Output counter state to LEDs
    SJMP UP_DOWN_COUNTER      ; Repeat
END

