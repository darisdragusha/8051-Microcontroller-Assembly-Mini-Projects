ORG 0000H

; Constants
CLOCK_FREQ  EQU 11059200       ; 11.0592 MHz Clock Frequency
BAUD_RATE   EQU 9600           ; Baud rate
TH1_VALUE   EQU -3             ; Timer 1 reload value for 9600 baud rate

; Timeout interval (~100 ms)
TIMEOUT_LOW  EQU 0B0H          ; Low byte of timeout
TIMEOUT_HIGH EQU 3CH           ; High byte of timeout

; Ports
LED_PORT    EQU P1             ; LEDs connected to Port 1
SEGMENT_PORT EQU P2            ; 7-segment display connected to Port 2

; Variables
LAST_BYTE   EQU 30H            ; Memory location to store last received byte
BYTE_COUNT  EQU 31H            ; Memory location to store byte count
TIMEOUT_FLAG EQU 32H           ; Flag for timeout detection

; Main program
MAIN:
    MOV TMOD, #20H             ; Timer 1 in Mode 2 for serial communication
    MOV TH1, #TH1_VALUE        ; Load Timer 1 for baud rate
    MOV SCON, #50H             ; Serial mode 1, REN enabled
    SETB TR1                   ; Start Timer 1

    ; Initialize Timer 0 for timeout
    MOV TMOD, #21H             ; Timer 0 in Mode 1
    CLR TR0                    ; Stop Timer 0

    ; Initialize variables
    MOV LED_PORT, #00H         ; Clear LEDs
    MOV SEGMENT_PORT, #00H     ; Clear 7-segment display
    CLR TIMEOUT_FLAG           ; Clear timeout flag
    MOV BYTE_COUNT, #00H       ; Reset byte count to 0

    ; Enable interrupts
    SETB EA                    ; Enable global interrupts
    SETB ES                    ; Enable serial interrupt

LOOP:
    JB TIMEOUT_FLAG, HANDLE_TIMEOUT ; Check timeout flag
    SJMP LOOP                        ; Infinite loop

HANDLE_TIMEOUT:
    CLR TIMEOUT_FLAG           ; Clear timeout flag
    MOV BYTE_COUNT, #00H       ; Reset byte count
    SJMP LOOP

; Serial interrupt service routine
SERIAL_ISR:
    JNB RI, NO_RX              ; Check if data received
    CLR RI                     ; Clear receive interrupt flag
    MOV A, SBUF                ; Move received byte to A

    ; Store received byte and increment count
    MOV LAST_BYTE, A           ; Save last received byte
    INC BYTE_COUNT             ; Increment byte count

    ; Update LEDs
    MOV A, BYTE_COUNT          ; Display byte count on LEDs
    MOV LED_PORT, A            ; Send to LED port

    ; Update 7-segment display
    ANL A, #0FH                ; Extract lower nibble for BCD
    MOV DPTR, #SEGMENT_TABLE
    MOVC A, @A+DPTR            ; Get 7-segment pattern
    MOV SEGMENT_PORT, A        ; Display pattern

    ; Reset Timer 0 for timeout
    MOV TH0, #TIMEOUT_HIGH     ; Reload high byte
    MOV TL0, #TIMEOUT_LOW      ; Reload low byte
    SETB TR0                   ; Start Timer 0

NO_RX:
    RETI                       ; Return from interrupt

; Timer 0 interrupt service routine
TIMER0_ISR:
    CLR TR0                    ; Stop Timer 0
    SETB TIMEOUT_FLAG          ; Set timeout flag
    RETI                       ; Return from interrupt

; Lookup table for 7-segment display
SEGMENT_TABLE:
    DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH
    ; BCD representation for digits 0-9

END
