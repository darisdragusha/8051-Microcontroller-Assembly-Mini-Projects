

ORG 0000H           ; Program start

MAIN:
    MOV P2, #0FFH   ; Configure Port 2 (digit select) as output
    MOV P3, #00H    ; Configure Port 3 (segment select) as output
    MOV P1, #0FFH   ; Configure Port 1 as input (DIP switches)

INIT:
    CLR P2          ; Ensure no digit is selected
    CLR P3          ; Ensure no segments are lit
    MOV R7, #00H    ; Initialize mode register (e.g., mode = 0: display off)

LOOP:
    ACALL READ_SWITCHES   ; Read DIP switch state
    ACALL DISPLAY_NUMBERS ; Display selected numbers
    SJMP LOOP             ; Repeat indefinitely

; Subroutine: READ_SWITCHES
READ_SWITCHES:
    MOV A, P1       ; Read DIP switch state
    CJNE A, #00H, SELECT_MODE ; If any switch is on, select mode
    ACALL DISPLAY_OFF ; If no switches are on, turn off display
    RET

SELECT_MODE:
    ; Determine display mode based on DIP switch state
    MOV R7, A       ; Save current DIP switch state to register
    RET

; Subroutine: DISPLAY_NUMBERS
DISPLAY_NUMBERS:
    MOV A, R7       ; Retrieve current mode
    ; Check specific modes and call respective display logic
    JZ DISPLAY_OFF      ; If mode = 0, turn off display
    JB ACC.0, DISPLAY_FIRST_NUMBER ; Check bit 0
    JB ACC.1, DISPLAY_LAST_NUMBER  ; Check bit 1
    ; Add additional checks for other modes as needed
    RET

; Subroutine: DISPLAY_FIRST_NUMBER
DISPLAY_FIRST_NUMBER:
    ACALL LOAD_NUMBER   ; Load the first selected number
    ACALL MULTIPLEX     ; Display the number with multiplexing
    RET

; Subroutine: DISPLAY_LAST_NUMBER
DISPLAY_LAST_NUMBER:
    ACALL LOAD_NUMBER   ; Load the last selected number
    ACALL MULTIPLEX     ; Display the number with multiplexing
    RET

; Subroutine: MULTIPLEX
MULTIPLEX:
    ; Multiplexing with time delay
    MOV DPTR, #DISPLAY_TABLE ; Point to digit encoding table
    MOV R6, #04H             ; 4 digits to display
MULTIPLEX_LOOP:
    MOV A, @DPTR+R6          ; Load digit encoding
    MOV P3, A                ; Output segments to Port 3
    MOV P2, #0FEH            ; Select digit (e.g., 1st digit)
    ACALL DELAY              ; Short delay
    ; Repeat for remaining digits (adjust row select as needed)
    DJNZ R6, MULTIPLEX_LOOP
    RET

; Subroutine: LOAD_NUMBER
LOAD_NUMBER:
    ; Loads the selected 4-digit number into display buffer
    MOV DPTR, #NUMBER_TABLE ; Point to number table
    ; Add logic to load the appropriate number based on mode (R7)
    RET

; Subroutine: DISPLAY_OFF
DISPLAY_OFF:
    MOV P2, #0FFH   ; Turn off all digit selects
    MOV P3, #00H    ; Turn off all segments
    RET

; Subroutine: DELAY
DELAY:
    MOV R5, #0FFH   ; Arbitrary delay
DELAY_LOOP:
    DJNZ R5, DELAY_LOOP
    RET

; Data: Digit Encoding Table for 7-Segment Display (CC Example)
DISPLAY_TABLE:
    DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH ; 0-9

; Data: Predefined 4-Digit Numbers
NUMBER_TABLE:
    DB 1234H, 5678H, 9012H, 3456H, 7890H, 2345H, 6789H, 0123H

END

