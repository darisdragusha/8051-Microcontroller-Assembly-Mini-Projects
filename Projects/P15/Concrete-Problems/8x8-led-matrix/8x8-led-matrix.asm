

ORG 0000H           ; Program start

MAIN:
    MOV P2, #0FFH   ; Configure Port 2 (row select) as output
    MOV P3, #00H    ; Configure Port 3 (column select) as output
    MOV P1, #0FFH   ; Configure Port 1 as input (DIP switches)

INIT:
    CLR P2          ; Ensure no rows are selected
    CLR P3          ; Ensure no columns are active
    MOV R7, #00H    ; Initialize mode register (e.g., mode = 0: display off)

LOOP:
    ACALL READ_SWITCHES   ; Read DIP switch state
    ACALL DISPLAY_PATTERN ; Display the selected pattern
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

; Subroutine: DISPLAY_PATTERN
DISPLAY_PATTERN:
    MOV A, R7       ; Retrieve current mode
    ; Check specific modes and call respective display logic
    JZ DISPLAY_OFF       ; If mode = 0, turn off display
    JB ACC.0, DISPLAY_FIRST_PATTERN ; Check bit 0
    JB ACC.1, DISPLAY_LAST_PATTERN  ; Check bit 1
    ; Add additional checks for other modes as needed
    RET

; Subroutine: DISPLAY_FIRST_PATTERN
DISPLAY_FIRST_PATTERN:
    ACALL LOAD_PATTERN   ; Load the first selected pattern
    ACALL MULTIPLEX      ; Display the pattern with multiplexing
    RET

; Subroutine: DISPLAY_LAST_PATTERN
DISPLAY_LAST_PATTERN:
    ACALL LOAD_PATTERN   ; Load the last selected pattern
    ACALL MULTIPLEX      ; Display the pattern with multiplexing
    RET

; Subroutine: MULTIPLEX
MULTIPLEX:
    ; Multiplexing with time delay
    MOV DPTR, #PATTERN_TABLE ; Point to pattern table
    MOV R6, #08H             ; 8 rows to display
MULTIPLEX_LOOP:
    MOV A, @DPTR+R6          ; Load row data for the pattern
    MOV P3, A                ; Output column data to Port 3
    MOV P2, #0FEH            ; Select row (e.g., 1st row)
    ACALL DELAY              ; Short delay
    ; Repeat for remaining rows (adjust row select as needed)
    DJNZ R6, MULTIPLEX_LOOP
    RET

; Subroutine: LOAD_PATTERN
LOAD_PATTERN:
    ; Load the selected pattern into the display buffer
    MOV DPTR, #PATTERN_TABLE ; Point to the pattern table
    ; Add logic to load the appropriate pattern based on mode (R7)
    RET

; Subroutine: DISPLAY_OFF
DISPLAY_OFF:
    MOV P2, #0FFH   ; Turn off all rows
    MOV P3, #00H    ; Turn off all columns
    RET

; Subroutine: DELAY
DELAY:
    MOV R5, #0FFH   ; Arbitrary delay
DELAY_LOOP:
    DJNZ R5, DELAY_LOOP
    RET

; Data: Predefined Patterns
PATTERN_TABLE:
    ; Each pattern is an 8-byte array (1 byte per row, 8 rows total)
    DB 0FFH, 81H, 81H, 81H, 81H, 81H, 81H, 0FFH ; Pattern 1: Box
    DB 00H, 18H, 3CH, 7EH, 7EH, 3CH, 18H, 00H   ; Pattern 2: Diamond
    DB 81H, 42H, 24H, 18H, 18H, 24H, 42H, 81H   ; Pattern 3: X
    ; Add more patterns as needed

END

