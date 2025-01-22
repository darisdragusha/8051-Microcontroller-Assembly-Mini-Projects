

ORG 0000H             ; Start of the program
MAIN:
    ; Initialize ports
    MOV P1, #0FFH      ; Port 1 as input for base unit selection (DIP switches)
    MOV P2, #00H       ; Port 2 as output for result display
    MOV P3, #00H       ; Port 3 for LED display

    ; Initialize numbers and base units
    MOV DPTR, #NUM1    ; Pointer to the first number
    MOVX A, @DPTR
    MOV R0, A          ; Store the first number in R0

    MOV DPTR, #NUM2    ; Pointer to the second number
    MOVX A, @DPTR
    MOV R1, A          ; Store the second number in R1

    ; Base unit selection
    MOV A, P1          ; Read DIP switches
    CJNE A, #01H, BASE_BYTE
    CALL ADD_BITS
    SJMP DISPLAY_RESULT

BASE_BYTE:
    CJNE A, #02H, BASE_HEX
    CALL ADD_BYTES
    SJMP DISPLAY_RESULT

BASE_HEX:
    CJNE A, #03H, BASE_BCD
    CALL ADD_HEX
    SJMP DISPLAY_RESULT

BASE_BCD:
    CJNE A, #04H, BASE_BCD2
    CALL ADD_BCD
    SJMP DISPLAY_RESULT

BASE_BCD2:
    CJNE A, #00H, DEFAULT_UNIT
    CALL ADD_BCD2
    SJMP DISPLAY_RESULT

DEFAULT_UNIT:
    ; If no base unit is selected, display length of result
    MOV A, #08H        ; Assume 8 bits as default length
    MOV P2, A          ; Display length on Port 2
    CLR P3.0           ; Turn off all LEDs
    SJMP END

ADD_BITS:
    ; Addition of numbers as bits
    MOV A, R0          ; Load first number
    ADD A, R1          ; Add second number
    RET

ADD_BYTES:
    ; Addition of numbers as bytes
    MOV A, R0
    ADD A, R1
    RET

ADD_HEX:
    ; Addition of numbers in HEX format
    MOV A, R0
    ADD A, R1
    RET

ADD_BCD:
    ; Addition of numbers in BCD format
    MOV A, R0
    ADD A, R1
    DA A               ; Decimal adjust for BCD
    RET

ADD_BCD2:
    ; Addition of numbers as two BCDs in one byte
    MOV A, R0
    ADD A, R1
    DA A
    RET

DISPLAY_RESULT:
    ; Display the result on the specified output
    MOV P2, A          ; Display result on Port 2
    MOV P3.0, C        ; Light up corresponding LED
    RET

END:
    SJMP END           ; End of program

; Define numbers
NUM1: DB 0AH           ; First number
NUM2: DB 05H           ; Second number

