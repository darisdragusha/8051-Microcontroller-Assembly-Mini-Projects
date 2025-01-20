ORG 0000H  

; Constants  
CLOCK_FREQ  EQU 11059200    ; 11.0592 MHz Clock Frequency  
BAUD_RATE   EQU 9600        ; Baud rate  
TH1_VALUE   EQU -3          ; Timer reload value for 9600 baud rate  

; Lookup table for 7-segment display (CC format)  
SEGMENT_TABLE: DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH  
; BCD representation for digits 0-9  

; Ports  
SEGMENT_PORT EQU P2          ; 7-segment display connected to P2  

; Initialization  
MAIN:  
    MOV TMOD, #20H          ; Timer 1, Mode 2 (auto-reload)  
    MOV TH1, #TH1_VALUE     ; Load Timer 1 for baud rate  
    MOV SCON, #50H          ; Serial mode 1, REN enabled  
    SETB TR1                ; Start Timer 1  
    SETB EA                 ; Enable global interrupts  
    SETB ES                 ; Enable serial interrupt  
    MOV SEGMENT_PORT, #00H  ; Clear segment display  

LOOP:  
    SJMP LOOP               ; Infinite loop  

; Serial Interrupt Service Routine  
SERIAL_ISR:  
    JNB RI, NO_RX           ; Check if data received  
    CLR RI                  ; Clear receive interrupt flag  
    MOV A, SBUF             ; Move received data to accumulator  
    ANL A, #0FH             ; Mask upper nibble (BCD format)  
    MOV DPTR, #SEGMENT_TABLE  
    MOVC A, @A+DPTR         ; Get segment code  
    MOV SEGMENT_PORT, A     ; Display on 7-segment  
    MOV SBUF, A             ; Echo back received data  
NO_RX:  
   
