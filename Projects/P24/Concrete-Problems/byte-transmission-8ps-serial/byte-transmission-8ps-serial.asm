ORG 0000H           ; Start of program
MAIN:
    ; Configure Timer for bit timing (Assume 9600 baud rate, 11.0592 MHz crystal)
    MOV TMOD, #20H  ; Timer 1 in Mode 2 (8-bit auto-reload)
    MOV TH1, #-3    ; Set Timer 1 reload value for 9600 baud
    SETB TR1        ; Start Timer 1

    ; Pin configuration (Assume P3.0 for TX)
    SETB P3.0       ; Default TX pin to High (Idle)

    ; Parity and stop-bit configuration
    MOV R0, #00H    ; 0 - Odd parity, 1 stop bit
                    ; 1 - Even parity, 1 stop bit
                    ; 2 - Odd parity, 2 stop bits
                    ; 3 - Even parity, 2 stop bits

    ; Initialize buffer pointers
    MOV DPTR, #BUFFER   ; Point to buffer containing bytes to send
    MOV R1, #0          ; Index for the buffer

TX_LOOP:
    MOV A, @DPTR        ; Load byte from the buffer
    ACALL CALC_PARITY   ; Calculate parity bit
    ACALL SEND_BYTE     ; Send byte with 8PS format

    INC DPTR            ; Move to next byte in the buffer
    SJMP TX_LOOP        ; Loop to send the next byte

SEND_BYTE:
    ; Start-bit
    CLR P3.0            ; Logical Low (0)
    ACALL BIT_DELAY

    ; Transmit 8 data bits (LSB first)
    MOV R2, #08         ; Bit counter
SEND_DATA_BITS:
    MOV C, ACC.0        ; Move LSB to Carry
    MOV P3.0, C         ; Output to TX pin
    ACALL BIT_DELAY
    RRC A               ; Rotate right through Carry
    DJNZ R2, SEND_DATA_BITS

    ; Transmit parity bit
    MOV P3.0, C         ; Send calculated parity
    ACALL BIT_DELAY

    ; Transmit stop-bit(s)
    SETB P3.0           ; Logical High (1)
    ACALL BIT_DELAY
    MOV A, R0
    ANL A, #02H         ; Check for 2 stop bits
    JZ SINGLE_STOP
    ACALL BIT_DELAY     ; Second stop bit
SINGLE_STOP:
    RET

CALC_PARITY:
    ; Calculate parity (Odd/Even)
    CLR C               ; Clear Carry
    MOV R2, #08         ; Initialize bit counter
CALC_LOOP:
    MOV C, ACC.0        ; Check LSB
    RRC A               ; Rotate right
    CPL C               ; Invert Carry for Odd parity
    MOV ACC.0, C        ; Store result back in Accumulator
    DJNZ R2, CALC_LOOP  ; Repeat for all bits

    ; Adjust for Even parity if required
    MOV A, R0
    ANL A, #01H         ; Check parity mode
    JZ PARITY_DONE
    CPL C               ; Invert Carry for Even parity
PARITY_DONE:
    RET

BIT_DELAY:
    ; Delay for one bit duration (9600 baud)
    MOV R3, #250
DELAY_LOOP:
    DJNZ R3, DELAY_LOOP
    RET

BUFFER:
    DB 'HELLO', 00H     ; Sample data to transmit
END
