
ORG 0000H          ; Start of program
MAIN:
    MOV P1, #0FFH  ; Configure P1 as input
    MOV P3, #0FFH  ; Configure P3 as input
    MOV P2, #00H   ; Configure P2 as output

    MOV A, P1      ; Read first input
    XRL A, P3      ; Perform XOR with second input
    CPL A          ; Complement result to get XNOR
    MOV P2, A      ; Output result to P2 (LED array)
    SJMP MAIN      ; Repeat the loop

END                ; End of the program
