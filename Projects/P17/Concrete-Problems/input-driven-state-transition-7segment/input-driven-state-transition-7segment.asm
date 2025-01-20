ORG 0000H

; Define constants
SEGMENT_PORT EQU P1         ; Port connected to 7-segment display
INPUT_PORT   EQU P2         ; Port connected to DIP switch
CC_LOOKUP_TABLE: DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H
; Hexadecimal representation for digits 0-7 on CC 7-segment display

MAIN:
    MOV SEGMENT_PORT, #00H  ; Clear display initially
    MOV INPUT_PORT, #0FFH   ; Configure P2 as input
LOOP:
    MOV A, INPUT_PORT       ; Read DIP switch
    ANL A, #07H             ; Mask upper 5 bits (limit to states 0-7)
    MOV DPTR, #CC_LOOKUP_TABLE
    MOVC A, @A+DPTR         ; Get 7-segment code
    MOV SEGMENT_PORT, A     ; Display digit on 7-segment
    SJMP LOOP               ; Repeat

END
