

ORG 0000H          ; Start of program
MAIN:
    MOV P1, #0FFH  ; Configure P1 as input
    MOV P3, #0FFH  ; Configure P3 as input
    MOV P2, #00H   ; Configure P2 as output for 7-segment display

    MOV A, P1      ; Read first input
    XRL A, P3      ; Perform XOR with second input
    MOV R0, A      ; Store XOR result in R0
    MOV B, #00H    ; Initialize bit counter

COUNT_LOOP:
    RRC A          ; Rotate A right through carry
    JC INCREMENT   ; If carry is set, increment counter
    SJMP CHECK_DONE; Skip increment

INCREMENT:
    INC B          ; Increment bit counter

CHECK_DONE:
    JNZ COUNT_LOOP ; Repeat until A = 0

    MOV A, B       ; Move bit count to A
    ACALL BCD_TO_7SEG ; Convert count to 7-segment code
    MOV P2, A      ; Output to port P2
    SJMP MAIN      ; Repeat the loop

BCD_TO_7SEG:        ; Subroutine to convert BCD to 7-segment (CC)
    CPL A           ; (Example: Add table for mapping values to segments here)
    ; Custom mapping of numbers to segment values goes here
    RET

END                ; End of the program

