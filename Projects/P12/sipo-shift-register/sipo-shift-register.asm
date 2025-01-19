

ORG 0000H           ; Program start
MAIN:
    MOV P1, #0FFH   ; Configure Port 1 as input (DIP switches)
    MOV P2, #00H    ; Configure Port 2 for control signals (DS, STCP, SHCP)
    SETB P3.7       ; Configure P3.7 as a push-button input (active low)

INIT:
    CLR P2.0        ; Ensure Data In (DS) is low
    CLR P2.1        ; Ensure Clock (STCP) is low
    CLR P2.2        ; Ensure Latch (SHCP) is low

LOOP:
    JB P3.7, LOOP   ; Wait for the push button to be pressed (active low)

    MOV A, P1       ; Read input from DIP switches (Port 1)
    ACALL SHIFT_OUT ; Send the data to the shift register
    ACALL DISPLAY_HEX ; Display the value on the 7-segment
    SJMP LOOP       ; Repeat indefinitely

; Subroutine: SHIFT_OUT
SHIFT_OUT:
    MOV R2, #8      ; 8 bits to shift out
SHIFT_LOOP:
    MOV C, ACC.7    ; Get the MSB of A (bit to shift out)
    MOV P2.0, C     ; Write the bit to Data In (DS)
    SETB P2.1       ; Generate clock pulse (STCP)
    CLR P2.1
    RLC A           ; Rotate left through carry (shift next bit)
    DJNZ R2, SHIFT_LOOP

    SETB P2.2       ; Latch the output (SHCP pulse)
    CLR P2.2
    RET

; Subroutine: DISPLAY_HEX
DISPLAY_HEX:
    ; Converts A (binary input) to 7-segment HEX code
    MOV DPTR, #HEX_TABLE ; Point to HEX encoding table
    MOVC A, @A+DPTR      ; Get corresponding 7-segment code
    MOV P0, A            ; Display the code on 7-segment
    RET

; Data: HEX Encoding Table for 7-segment Display
HEX_TABLE:
    DB 3FH  ; '0'
    DB 06H  ; '1'
    DB 5BH  ; '2'
    DB 4FH  ; '3'
    DB 66H  ; '4'
    DB 6DH  ; '5'
    DB 7DH  ; '6'
    DB 07H  ; '7'
    DB 7FH  ; '8'
    DB 6FH  ; '9'
    DB 77H  ; 'A'
    DB 7CH  ; 'b'
    DB 39H  ; 'C'
    DB 5EH  ; 'd'
    DB 79H  ; 'E'
    DB 71H  ; 'F'

END

