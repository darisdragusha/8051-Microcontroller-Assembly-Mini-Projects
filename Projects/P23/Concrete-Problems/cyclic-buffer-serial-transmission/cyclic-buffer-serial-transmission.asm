ORG 0000H           ; Start of program
MAIN:
    MOV TMOD, #20H  ; Configure Timer 1 in Mode 2 (8-bit auto-reload)
    MOV TH1, #-3    ; Set Timer 1 for 9600 baud rate (11.0592 MHz crystal)
    MOV SCON, #50H  ; Configure UART: Mode 1, 8-bit data, 1 stop bit
    SETB TR1        ; Start Timer 1

    MOV R0, #BUFFER ; Point R0 to the circular buffer
    MOV R1, #0      ; Index for circular buffer
    MOV DPTR, #STRING1 ; Default string (can be updated dynamically)

    ACALL LOAD_BUFFER ; Load the buffer with the selected string

SEND_LOOP:
    MOV A, @R0      ; Read the current character from the buffer
    CJNE A, #0, TRANSMIT_CHAR ; If not null terminator, transmit
    AJMP SEND_LOOP   ; Restart loop for new characters

TRANSMIT_CHAR:
    ACALL DISPLAY_CHAR ; Display the character on the 7-segment display
    ACALL TRANSMIT    ; Transmit the character via UART
    INC R0            ; Increment buffer pointer
    MOV A, R1
    CJNE A, #BUFFER_SIZE, NO_WRAP
    MOV R0, #BUFFER   ; Wrap around to the start of the buffer
    CLR R1
NO_WRAP:
    INC R1            ; Increment buffer index
    ACALL DISPLAY_COUNT ; Display remaining buffer size
    SJMP SEND_LOOP

TRANSMIT:
    MOV SBUF, A       ; Load character into serial buffer
WAIT_TX:
    JNB TI, WAIT_TX   ; Wait for transmission to complete
    CLR TI            ; Clear transmit interrupt flag
    RET

DISPLAY_CHAR:
    MOV P1, A         ; Send ASCII value to Port 1 (7-segment display)
    RET

DISPLAY_COUNT:
    MOV A, R1         ; Load remaining count into A
    MOV P2, A         ; Display count on LEDs connected to Port 2
    RET

LOAD_BUFFER:
    MOV A, @DPTR      ; Load a character from the string
    JZ END_LOAD       ; Stop loading at null terminator
    MOV @R0, A        ; Store character in buffer
    INC DPTR          ; Move to the next character in the string
    INC R0            ; Move to the next position in the buffer
    SJMP LOAD_BUFFER
END_LOAD:
    RET

; Data Section
BUFFER_SIZE EQU 16     ; Circular buffer size
BUFFER: DS BUFFER_SIZE ; Allocate circular buffer

; Predefined Strings
STRING1:
    DB 0DH, 'C', 'I', 'R', 'C', 'U', 'L', 'A', 'R', 00H ; "CIRCULAR"
STRING2:
    DB 08H, 'B', 'U', 'F', 'F', 'E', 'R', 00H          ; "BUFFER"

END
