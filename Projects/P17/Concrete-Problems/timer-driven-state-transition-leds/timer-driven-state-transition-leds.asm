ORG 0000H
LJMP MAIN
ORG 000BH
LJMP TIMER_ISR

; Define constants
STATE_COUNT EQU 4           ; Total states: S0, S1, S2, S3
TIMER_DELAY EQU 1           ; Delay in seconds
LED_PORT    EQU P1          ; Port connected to LEDs

; Variables
CURRENT_STATE: DB 00H       ; Current state (0-3)

; Timer configuration
MAIN:
    MOV TMOD, #01H          ; Timer 0 Mode 1 (16-bit)
    SETB EA                 ; Enable global interrupts
    SETB ET0                ; Enable Timer 0 interrupt
    ACALL SET_TIMER         ; Configure Timer
    MOV LED_PORT, #00H      ; Turn off LEDs initially

LOOP:
    SJMP LOOP               ; Infinite loop

; Timer interrupt service routine
TIMER_ISR:
    CLR TF0                 ; Clear Timer 0 overflow flag
    ACALL UPDATE_STATE      ; Update current state
    ACALL DISPLAY_STATE     ; Display current state on LEDs
    ACALL SET_TIMER         ; Reset timer
    RETI                    ; Return from interrupt

SET_TIMER:
    ; Load timer for 1 second delay (assuming 12 MHz clock)
    MOV TH0, #0B8H          ; High byte
    MOV TL0, #0BH           ; Low byte
    SETB TR0                ; Start Timer 0
    RET

UPDATE_STATE:
    INC CURRENT_STATE       ; Increment state
    MOV A, CURRENT_STATE
    CJNE A, #STATE_COUNT, END_UPDATE
    CLR CURRENT_STATE       ; Reset to S0 if all states are completed
END_UPDATE:
    RET

DISPLAY_STATE:
    MOV A, CURRENT_STATE    ; Load current state
    MOV LED_PORT, A         ; Display state on LEDs
    RET

ORG 0030H
    LJMP MAIN               ; Jump to main program

ORG 000BH
    LJMP TIMER_ISR          ; Timer 0 interrupt vector

END
