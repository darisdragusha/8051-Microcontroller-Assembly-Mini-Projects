ORG 0000H

; Constants
CLOCK_FREQ   EQU 11059200         ; 11.0592 MHz Clock Frequency
BAUD_RATE    EQU 9600             ; Baud rate
TH1_VALUE    EQU -3               ; Timer 1 reload value for 9600 baud rate
BUFFER_SIZE  EQU 8                ; Cyclic buffer size

; Ports
LED_PORT     EQU P1               ; LEDs connected to Port 1
SEGMENT_PORT EQU P2               ; 7-segment display connected to Port 2

; Variables
BUFFER_START EQU 30H              ; Start of cyclic buffer
BUFFER_END   EQU BUFFER_START+BUFFER_SIZE ; End of cyclic buffer
WRITE_PTR    EQU 38H              ; Write pointer
READ_PTR     EQU 39H              ; Read pointer
COUNT        EQU 3AH              ; Number of bytes in the buffer
LAST_BYTE    EQU 3BH              ; Last received byte

; Main program
MAIN:
    MOV TMOD, #20H                ; Timer 1 in Mode 2 for serial communication
    MOV TH1, #TH1_VALUE           ; Load Timer 1 for baud rate
    MOV SCON, #50H                ; Serial mode 1, REN enabled
    SETB TR1                      ; Start Timer 1

    ; Initialize cyclic buffer
    MOV WRITE_PTR, #BUFFER_START  ; Set write pointer to buffer start
    MOV READ_PTR, #BUFFER_START   ; Set read pointer to buffer start
    MOV COUNT, #00H               ; Initialize byte count

    ; Initialize outputs
    MOV LED_PORT, #00H            ; Clear LEDs
    MOV SEGMENT_PORT, #00H        ; Clear 7-segment display

    ; Enable serial interrupt
    SETB EA                       ; Enable global interrupts
    SETB ES                       ; Enable serial interrupt

LOOP:
    SJMP LOOP                     ; Infinite loop

; Serial interrupt service routine
SERIAL_ISR:
    JNB RI, NO_RX                 ; Check if data received
    CLR RI                        ; Clear receive interrupt flag
    MOV A, SBUF                   ; Move received byte to A

    ; Store byte in cyclic buffer
    MOV @WRITE_PTR, A             ; Write data to buffer
    MOV LAST_BYTE, A              ; Store last received byte
    INC WRITE_PTR                 ; Increment write pointer
    CJNE WRITE_PTR, #BUFFER_END, SKIP_WRAP
    MOV WRITE_PTR, #BUFFER_START  ; Wrap around write pointer

SKIP_WRAP:
    INC COUNT                     ; Increment byte count
    MOV A, COUNT                  ; Check buffer overflow
    CJNE A, #BUFFER_SIZE, NO_OVERFLOW
    DEC COUNT                     ; Maintain buffer size

NO_OVERFLOW:
    ; Update LEDs
    MOV A, COUNT                  ; Display buffer count on LEDs
    MOV LED_PORT, A

    ; Update 7-segment display
    ANL A, #0FH                   ; Extract lower nibble for BCD
    MOV DPTR, #SEGMENT_TABLE
    MOVC A, @A+DPTR               ; Get 7-segment pattern
    MOV SEGMENT_PORT, A           ; Display pattern
    RETI

NO_RX:
    RETI

; Lookup table for 7-segment display
SEGMENT_TABLE:
    DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH
    ; BCD representation for digits 0-9

END
