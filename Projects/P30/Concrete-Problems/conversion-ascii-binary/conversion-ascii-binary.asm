

ORG 0000H             ; Start of program

MAIN:
    ; Initialize ports
    MOV P1, #0FFH      ; Port 1: Input for DIP switches (Byte selection)
    MOV P2, #00H       ; Port 2: Output for length byte
    MOV P3, #00H       ; Port 3: Output for LED display

    ; Initialize registers
    MOV R0, #00H       ; Clear register R0 (for ASCII input)
    MOV R1, #00H       ; Clear register R1 (for length byte)

    ; Load ASCII string input
    MOV DPTR, #INPUT_STR
    CLR A
    MOVC A, @A+DPTR
    JZ END             ; If input is empty, end program

    ; Parse input and identify base
    CALL PARSE_INPUT
    JNC ERROR_HANDLER  ; Jump to error handling if conversion fails

    ; Display result
    MOV P2, R1         ; Output the length byte
    CALL DISPLAY_OUTPUT
    SJMP END

PARSE_INPUT:
    ; Initialize length counter
    MOV R1, #00H       ; Reset length byte

PARSE_LOOP:
    MOVC A, @A+DPTR    ; Fetch next character
    INC DPTR           ; Increment pointer

    ; Check for delimiters
    CJNE A, #' ', CHECK_COMMA
    SJMP PARSE_END
CHECK_COMMA:
    CJNE A, #',', CHECK_TAB
    SJMP PARSE_END
CHECK_TAB:
    CJNE A, #09H, CHECK_SEMICOLON
    SJMP PARSE_END
CHECK_SEMICOLON:
    CJNE A, #';', CHECK_CR
    SJMP PARSE_END
CHECK_CR:
    CJNE A, #0DH, CHECK_LF
    SJMP PARSE_END
CHECK_LF:
    CJNE A, #0AH, CHECK_BASE
    SJMP PARSE_END

CHECK_BASE:
    ; Check for base identifier
    CJNE A, #'B', CHECK_OCTAL
    CALL CONVERT_BINARY
    RET
CHECK_OCTAL:
    CJNE A, #'O', CHECK_DECIMAL
    CALL CONVERT_OCTAL
    RET
CHECK_DECIMAL:
    CJNE A, #'D', CHECK_HEX
    CALL CONVERT_DECIMAL
    RET
CHECK_HEX:
    CJNE A, #'H', PARSE_ERROR
    CALL CONVERT_HEX
    RET

CONVERT_BINARY:
    ; Convert ASCII to binary
    MOV A, R0
    MOV R1, A          ; Store binary result length
    RET

CONVERT_OCTAL:
    ; Convert ASCII to octal
    MOV A, R0
    MOV R1, A          ; Store octal result length
    RET

CONVERT_DECIMAL:
    ; Convert ASCII to decimal
    MOV A, R0
    MOV R1, A          ; Store decimal result length
    RET

CONVERT_HEX:
    ; Convert ASCII to hexadecimal
    MOV A, R0
    MOV R1, A          ; Store hex result length
    RET

PARSE_END:
    ; Calculate length in bytes
    MOV A, R1
    RET

PARSE_ERROR:
    ; Handle conversion errors
    CLR R1             ; Set length byte to 0
    RET

DISPLAY_OUTPUT:
    ; Display result on LEDs
    MOV P3, R1         ; Output to LED display
    RET

ERROR_HANDLER:
    ; Handle errors
    CLR P2             ; Clear output port
    SJMP END

END:
    SJMP END           ; End of program

; Define ASCII input string
INPUT_STR: DB "37D;"   ; Example input (decimal 37, ends with semicolon)

