

ORG 0000H             ; Start of the program
MAIN:
    ; Initialize ports
    MOV P1, #0FFH      ; Port 1 as input for base unit selection (DIP switches)
    MOV P2, #00H       ; Port 2 as output for result display
    MOV P3, #00H       ; Port 3 for LED display

    ; Initialize number and base unit
    MOV DPTR, #NUM     ; Pointer to the number
    MOVX A, @DPTR
    MOV R0, A          ; Store the number in R0

    ; Base unit selection
    MOV A, P1          ; Read DIP switches
    CJNE A, #01H, BASE_BYTE
    CALL CONVERT_TO_BITS
    SJMP DISPLAY_RESULT

BASE_BYTE:
    CJNE A, #02H, BASE_HEX
    CALL CONVERT_TO_BYTES
    SJMP DISPLAY_RESULT

BASE_HEX:
    CJNE A, #03H, BASE_BCD
    CALL CONVERT_TO_HEX
    SJMP DISPLAY_RESULT

BASE_BCD:
    CJNE A, #04H, BASE_BCD2
    CALL CONVERT_TO_BCD
    SJMP DISPLAY_RESULT

BASE_BCD2:
    CJNE A, #00H, DEFAULT_UNIT
    CALL CONVERT_TO_BCD2
    SJMP DISPLAY_RESULT

DEFAULT_UNIT:
    ; If no base unit is selected, display length of result
    MOV A, #08H        ; Assume 8 bits as default length
    MOV P2, A          ; Display length on Port 2
    CLR P3.0           ; Turn off all LEDs
    SJMP END

CONVERT_TO_BITS:
    ; Convert to bits (already in binary format)
    MOV A, R0          ; Load number
    RET

CONVERT_TO_BYTES:
    ; Convert to bytes (divide by 8)
    MOV A, R0
    RRC A              ; Shift right to divide by 8
    RRC A
    RRC A
    RET

CONVERT_TO_HEX:
    ; Convert to HEX (same representation as bytes)
    MOV A, R0
    RET

CONVERT_TO_BCD:
    ; Convert to BCD (adjust binary to BCD)
    MOV A, R0
    DA A               ; Decimal adjust for BCD
    RET

CONVERT_TO_BCD2:
    ; Convert to two BCDs in a byte
    MOV A, R0
    DA A
    RET

DISPLAY_RESULT:
    ; Display result on the specified output
    MOV P2, A          ; Display result on Port 2
    MOV P3.0, C        ; Light up corresponding LED
    RET

END:
    SJMP END           ; End of program

; Define number
NUM: DB 45H           ; Example input number (decimal 69)

