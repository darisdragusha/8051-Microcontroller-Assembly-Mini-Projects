

ORG 0000H           ; Program start

MAIN:
    MOV P2, #00H    ; Configure Port 2 for shift register control signals
    MOV P0, #00H    ; Configure Port 0 as output (LEDs or 7-segment display)
    SETB P3.7       ; Configure P3.7 as a push-button input (active low)

INIT:
    CLR P2.0        ; Ensure Serial Out (QH) is low
    CLR P2.1        ; Ensure Clock (SHCP) is low
    CLR P2.2        ; Ensure Latch Enable (PL) is low

LOOP:
    JB P3.7, LOOP   ; Wait for the push button to be pressed (active low)

    ACALL LATCH_INPUTS ; Latch inputs from DIP switches
    ACALL READ_DATA     ; Read serial data from 74HC165
    ACALL DISPLAY       ; Display the data on LEDs and 7-segment
    SJMP LOOP           ; Repeat indefinitely

; Subroutine: LATCH_INPUTS
LATCH_INPUTS:
    CLR P2.2        ; Pull PL low to latch parallel data
    SETB P2.2       ; Release PL to enable serial output
    RET

; Subroutine: READ_DATA
READ_DATA:
    MOV R2, #8      ; Read 8 bits
    CLR A           ; Clear accumulator
READ_LOOP:
    SETB P2.1       ; Generate clock pulse (SHCP high)
    MOV C, P2.0     ; Read bit from Serial Out (QH)
    RLC A           ; Shift into accumulator (LSB to MSB)
    CLR P2.1        ; Clock low
    DJNZ R2, READ_LOOP
    RET

; Subroutine: DISPLAY
DISPLAY:
    MOV P0, A       ; Send data to LEDs (binary display)
    ACALL DISPLAY_HEX ; Display HEX on 7-segment
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

