
ORG 0000H          ; Start of program
MAIN:
    MOV P1, #0FFH  ; Configure P1 as input (set all pins high to read switches)
    MOV P3, #0FFH  ; Configure P3 as input
    MOV P2, #00H   ; Configure P2 as output (clear output for lower nibble)
    MOV P0, #00H   ; Configure P0 as output (clear output for upper nibble)

    MOV A, P1      ; Read first 8-bit input from port P1
    ORL A, P3      ; Perform logical OR with second input from port P3
    MOV R0, A      ; Store result in R0

    ANL A, #0FH    ; Mask lower nibble (00001111B)
    ACALL DISPLAY_LOWER ; Call subroutine to display lower nibble on P2

    MOV A, R0      ; Reload result
    SWAP A         ; Swap nibbles (upper nibble becomes lower)
    ANL A, #0FH    ; Mask lower nibble (original upper nibble)
    ACALL DISPLAY_UPPER ; Call subroutine to display upper nibble on P0
    SJMP MAIN      ; Repeat the loop

DISPLAY_LOWER:      ; Subroutine for lower nibble
    MOV P2, A      ; Output lower nibble to P2
    RET

DISPLAY_UPPER:      ; Subroutine for upper nibble
    MOV P0, A      ; Output upper nibble to P0
    RET

END                ; End of the program

