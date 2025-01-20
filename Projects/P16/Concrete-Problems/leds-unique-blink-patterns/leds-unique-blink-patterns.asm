

ORG 0000H           ; Program start

; Define constants and configuration
LED_PORT   EQU P1    ; Port connected to LEDs
N_LEDS     EQU 4     ; Number of LEDs
T_BASE_MS  EQU 1     ; Base time unit in milliseconds (1 ms)

; Define logical levels for LEDs
LED_ON_H   EQU 1     ; Logic high turns LED ON
LED_ON_L   EQU 0     ; Logic low turns LED ON

; Timing configuration for LEDs (example for 4 LEDs)
; T_On, T_Off, or T_Period values expressed as multiples of T_BASE_MS
T_ON_TABLE:  DB 10, 20, 30, 40    ; ON times in ms
T_OFF_TABLE: DB 50, 40, 30, 20    ; OFF times in ms
T_PERIOD_TABLE: DB 60, 60, 60, 60 ; Period times in ms (Mode 2 & 3)

MAIN:
    ; Initialization
    MOV LED_PORT, #00H            ; Turn off all LEDs initially
    MOV TMOD, #01H                ; Configure Timer 0 in Mode 1 (16-bit timer)
    MOV R0, #00H                  ; Index for current LED
    SETB EA                       ; Enable global interrupts
    SETB ET0                      ; Enable Timer 0 interrupt
    SJMP MAIN_LOOP

MAIN_LOOP:
    ; Main loop handles LED control
    ACALL UPDATE_LEDS             ; Update LED states based on timers
    SJMP MAIN_LOOP                ; Repeat indefinitely

; Subroutine: UPDATE_LEDS
UPDATE_LEDS:
    MOV R0, #00H                  ; Start with LED 0
UPDATE_LOOP:
    MOV A, R0
    CJNE A, #N_LEDS, END_UPDATE   ; Exit if all LEDs are processed
    ; Read LED timing parameters
    MOV DPTR, #T_ON_TABLE
    MOVC A, @A+DPTR               ; A = T_On for current LED
    MOV B, A                      ; Store T_On
    MOV DPTR, #T_OFF_TABLE
    MOVC A, @A+DPTR               ; A = T_Off for current LED
    ; Implement timing logic here (e.g., check T_On, T_Off)
    ; Update LED state accordingly
    INC R0                        ; Move to the next LED
    SJMP UPDATE_LOOP

END_UPDATE:
    RET

; Timer interrupt to generate T_base delays
TIMER0_ISR:
    ; Reset Timer 0 for 1 ms delay
    MOV TH0, #0FDH                ; Reload high byte
    MOV TL0, #0F3H                ; Reload low byte
    CLR TF0                       ; Clear Timer 0 overflow flag
    RETI                          ; Return from interrupt

END

