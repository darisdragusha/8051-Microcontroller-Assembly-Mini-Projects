ORG 0000H           ; Start of program
MAIN: 
    MOV TMOD, #20H  ; Set Timer 1 in Mode 2 (8-bit auto-reload)
    MOV TH1, #-3    ; Load Timer 1 for 9600 baud rate (11.0592 MHz crystal)
    MOV SCON, #50H  ; Configure UART: Mode 1, 8-bit data, 1 stop bit
    SETB TR1        ; Start Timer 1

    MOV DPTR, #STRING   ; Load the address of the string into DPTR
    MOV A, @DPTR        ; Load the first byte (number of characters)
    INC DPTR            ; Point to the first character in the string
    MOV R7, A           ; Store the character count in R7

SEND_LOOP:
    MOV A, @DPTR        ; Load the current character
    JZ END_TRANSMISSION ; If null terminator (00H), end transmission
    ACALL DISPLAY_CHAR  ; Display the character on 7-segment display
    ACALL TRANSMIT_CHAR ; Send the character via serial
    INC DPTR            ; Move to the next character
    DEC R7              ; Decrement character count
    ACALL DISPLAY_COUNT ; Update LED display with the remaining count
    SJMP SEND_LOOP      ; Repeat for the next character

END_TRANSMISSION:
    SJMP $              ; Loop indefinitely after transmission

; Subroutine: TRANSMIT_CHAR
; Sends the character in the accumulator (A) via UART
TRANSMIT_CHAR:
    MOV SBUF, A         ; Load the character into the serial buffer
WAIT:
    JNB TI, WAIT        ; Wait until transmission is complete
    CLR TI              ; Clear the transmit interrupt flag
    RET

; Subroutine: DISPLAY_CHAR
; Displays the ASCII value of the character in A on the 7-segment display
DISPLAY_CHAR:
    MOV P1, A           ; Send the ASCII value to Port 1
    RET

; Subroutine: DISPLAY_COUNT
; Displays the remaining character count on LEDs connected to Port 2
DISPLAY_COUNT:
    MOV A, R7           ; Load the remaining count
    MOV P2, A           ; Display it on LEDs
    RET

; Data Section
STRING:
    DB 05H, 'H', 'E', 'L', 'L', 'O', 00H ; String: "HELLO", 5 characters

END
