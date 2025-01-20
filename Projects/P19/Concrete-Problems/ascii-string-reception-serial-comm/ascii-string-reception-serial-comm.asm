
ORG 0000H  

; Constants  
CLOCK_FREQ  EQU 11059200    ; 11.0592 MHz Clock Frequency  
BAUD_RATE   EQU 9600        ; Baud rate  
TH1_VALUE   EQU -3          ; Timer reload value for 9600 baud rate  

; Ports  
LED_PORT    EQU P1          ; LEDs connected to Port 1  
SEGMENT_PORT EQU P2         ; 7-segment display connected to Port 2  

; Variables  
ASCII_LAST  EQU 30H         ; Memory location to store the last received ASCII character  
CHAR_COUNT  EQU 31H         ; Memory location to store character count  
CR_RECEIVED EQU 32H         ; Flag to track CR (0x0D) reception  


MAIN:  
    MOV TMOD, #20H          ; Timer 1, Mode 2 (auto-reload)  
    MOV TH1, #TH1_VALUE     ; Load Timer 1 for baud rate  
    MOV SCON, #50H          ; Serial mode 1, REN enabled  
    SETB TR1                ; Start Timer 1  
    MOV LED_PORT, #00H      ; Clear LEDs  
    MOV SEGMENT_PORT, #00H  ; Clear 7-segment display  
    CLR CR_RECEIVED         ; Clear CR flag  
    MOV CHAR_COUNT, #00H    ; Initialize character count to 0  
    SETB EA                 ; Enable global interrupts  
    SETB ES                 ; Enable serial interrupt  

LOOP:  
    SJMP LOOP               ; Infinite loop  


SERIAL_ISR:  
    JNB RI, NO_RX           ; Check if data received  
    CLR RI                  ; Clear receive interrupt flag  
    MOV A, SBUF             ; Move received character to accumulator  

    ; Check for CR (0x0D) or LF (0x0A)  
    CJNE A, #0DH, CHECK_LF  ; Is it CR?  
    SETB CR_RECEIVED        ; Set CR flag  
    SJMP INCREMENT_COUNT  

CHECK_LF:  
    CJNE A, #0AH, SAVE_CHAR ; Is it LF?  
    JB CR_RECEIVED, END_LINE ; If CR was already received, end the line  

SAVE_CHAR:  
    CLR CR_RECEIVED         ; Clear CR flag  
    MOV ASCII_LAST, A       ; Save received character  

INCREMENT_COUNT:  
    INC CHAR_COUNT          ; Increment character count  
    MOV A, CHAR_COUNT       ; Display count on LEDs  
    MOV LED_PORT, A         ; Send to LED port  

    ; Update 7-segment display  
    ANL A, #0FH             ; Extract lower nibble for BCD  
    MOV DPTR, #SEGMENT_TABLE  
    MOVC A, @A+DPTR         ; Get 7-segment pattern  
    MOV SEGMENT_PORT, A     ; Display pattern  

NO_RX:  
    RETI                    ; Return from interrupt  

END_LINE:  
    CLR CR_RECEIVED         ; Reset CR flag for next line  
    CLR CHAR_COUNT          ; Reset character count  
    RETI                    ; Return from interrupt  


SEGMENT_TABLE:  
    DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH  
; BCD representation for digits 0-9  

