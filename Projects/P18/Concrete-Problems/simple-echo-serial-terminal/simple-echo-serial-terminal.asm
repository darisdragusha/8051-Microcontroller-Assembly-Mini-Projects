ORG 0000H  

; Constants  
CLOCK_FREQ  EQU 11059200    ; 11.0592 MHz Clock Frequency  
BAUD_RATE   EQU 9600        ; Baud rate  
TH1_VALUE   EQU -3          ; Timer reload value for 9600 baud rate  

; Initialization  
MAIN:  
    MOV TMOD, #20H          ; Timer 1, Mode 2 (auto-reload)  
    MOV TH1, #TH1_VALUE     ; Load Timer 1 for baud rate  
    MOV SCON, #50H          ; Serial mode 1, REN enabled  
    SETB TR1                ; Start Timer 1  
    SETB EA                 ; Enable global interrupts  
    SETB ES                 ; Enable serial interrupt  

LOOP:  
    SJMP LOOP               ; Infinite loop  

; Serial Interrupt Service Routine  
SERIAL_ISR:  
    JNB RI, NO_RX           ; Check if data received  
    CLR RI                  ; Clear receive interrupt flag  
    MOV A, SBUF             ; Move received data to accumulator  
    MOV SBUF, A             ; Echo back received data  
NO_RX:  
    RETI                    ; Return from interrupt  

ORG 0023H                   ; Interrupt vector for serial communication  
    LJMP SERIAL_ISR         ; Jump to ISR  

END  
