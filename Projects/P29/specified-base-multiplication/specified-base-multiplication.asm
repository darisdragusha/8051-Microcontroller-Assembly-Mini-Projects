

ORG 0000H             ; Start of program

MAIN:
    ; Initialize ports
    MOV P1, #0FFH      ; Port 1: Input for DIP switches (Base unit selection)
    MOV P2, #00H       ; Port 2: Output for result display
    MOV P3, #00H       ; Port 3: Output for LED display
    MOV R0, #00H       ; Clear register R0
    MOV R1, #00H       ; Clear register R1

    ; Load inputs
    MOV DPTR, #NUM1    ; Load first number
    MOVX A, @DPTR
    MOV R0, A          ; Store first number in R0

    MOV DPTR, #NUM2    ; Load second number
    MOVX A, @DPTR
    MOV R1, A          ; Store second number in R1

    ; Base unit selection
    MOV A, P1          ; Read DIP switches
    CJNE A, #01H, BASE_BYTE
    CALL MULTIPLY_BITS
    SJMP DISPLAY_RESULT

BASE_BYTE:
    CJNE A, #02H, BASE_HEX
    CALL MULTIPLY_BYTES
    SJMP DISPLAY_RESULT

BASE_HEX:
    CJNE A, #03H, BASE_BCD
    CALL MULTIPLY_HEX
    SJMP DISPLAY_RESULT

BASE_BCD:
    CJNE A, #04H, BASE_BCD2
    CALL MULTIPLY_BCD
    SJMP DISPLAY_RESULT

BASE_BCD2:
    CJNE A, #00H, DEFAULT_UNIT
    CALL MULTIPLY_BCD2
    SJMP DISPLAY_RESULT

DEFAULT_UNIT:
    ; If no base unit is selected, display result length
    MOV A, #08H        ; Default length in bits
    MOV P2, A          ; Output result length to Port 2
    CLR P3.0           ; Turn off all LEDs
    SJMP END

MULTIPLY_BITS:
    ; Multiply numbers as bits
    MOV A, R0
    MUL AB             ; Multiply A (R0) by B (R1)
    RET

MULTIPLY_BYTES:
    ; Convert bits to bytes and multiply
    MOV A, R0
    RRC A              ; Divide R0 by 8 (Shift right 3 times)
    RRC A
    RRC A
    MOV B, R1
    RRC B              ; Divide R1 by 8
    RRC B
    RRC B
    MUL AB
    RET

MULTIPLY_HEX:
    ; Multiply numbers in HEX
    MOV A, R0
    MUL AB             ; Same as bit multiplication
    RET

MULTIPLY_BCD:
    ; Multiply numbers in BCD
    MOV A, R0
    MUL AB             ; Multiply BCD values
    DA A               ; Adjust to BCD
    RET

MULTIPLY_BCD2:
    ; Multiply numbers as two BCDs
    MOV A, R0
    MUL AB
    DA A
    RET

DISPLAY_RESULT:
    ; Display result on the specified output
    MOV P2, A          ; Output result to Port 2
    MOV P3.0, C        ; Illuminate corresponding LED
    RET

END:
    SJMP END           ; End of program

; Define input numbers
NUM1: DB 25H          ; Example number 1 (decimal 37)
NUM2: DB 17H          ; Example number 2 (decimal 23)

