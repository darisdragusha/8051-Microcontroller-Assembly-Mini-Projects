

ORG 0000H             ; Program start
SEGMENT_TABLE:
    DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH ; BCD to 7-segment

MAIN:
    MOV R7, #09H      ; Initialize counter to 9 (BCD)
    MOV P1, #00H      ; Configure P1 as input
    MOV P0, #00H            ; Clear 7-segment display

DOWN_COUNTER:
    MOV DPTR, #SEGMENT_TABLE ; Point to segment table
    MOVC A, @A+DPTR          ; Get segment code for BCD value in R7
    MOV P0, A                ; Output to 7-segment display

    JNB P1.1, NO_RESET       ; Check reset signal (P1.1)
    MOV R7, #09H             ; Reset counter to 9
NO_RESET:
    JNB P1.0, DOWN_COUNTER   ; Wait for decrement signal (P1.0)
    DEC R7                   ; Decrement counter
    CJNE R7, #0FH, DOWN_COUNTER ; Loop until counter rolls over
    MOV R7, #09H             ; Reload counter to 9
    SJMP DOWN_COUNTER        ; Repeat
END

