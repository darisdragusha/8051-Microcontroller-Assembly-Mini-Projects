

ORG 0000H            ; Program start
MAIN:
    MOV P1, #0F0H    ; Set Port 1 (rows) as input, pull-up resistors active
    MOV P2, #0F0H    ; Set Port 2 (columns) as input
    MOV A, #00H      ; Clear accumulator (for status checking)

SCAN_LOOP:
    CLR A            ; Clear accumulator
    MOV P1, #0F0H    ; Activate rows
    ACALL SCAN_KEYS  ; Call subroutine to detect keypress
    JZ NO_KEY        ; If no key pressed, jump to "No Key" routine

    MOV R0, A        ; Store detected key value in R0
    ACALL MULTIPLE_KEYS ; Check for multiple key presses
    JZ SINGLE_KEY    ; If single key pressed, display HEX value
    SJMP DISPLAY_MINUS ; If multiple keys pressed, display "-"

NO_KEY:
    CLR P3           ; Turn off LEDs
    CLR P0           ; Turn off 7-segment display
    SJMP SCAN_LOOP   ; Restart scanning

SINGLE_KEY:
    MOV P3, R0       ; Send key value to LEDs
    ACALL DISPLAY_HEX ; Display key on 7-segment
    SJMP SCAN_LOOP   ; Restart scanning

DISPLAY_MINUS:
    MOV P0, #40H     ; Display "-" on 7-segment (Common Cathode encoding)
    SJMP SCAN_LOOP   ; Restart scanning

; Subroutine: SCAN_KEYS
SCAN_KEYS:
    MOV R2, #04H     ; 4 rows
ROW_LOOP:
    MOV P1, #0FEH    ; Select first row (shift bit left each iteration)
    ACALL READ_COLUMN ; Call column read subroutine
    CJNE A, #00H, FOUND_KEY ; If key detected, jump to "FOUND_KEY"
    RR A             ; Rotate row selector
    DJNZ R2, ROW_LOOP ; Repeat for all rows
    CLR A            ; No key found
    RET

FOUND_KEY:
    MOV A, P2        ; Store column value (active low)
    RET

; Subroutine: READ_COLUMN
READ_COLUMN:
    MOV A, P2        ; Read columns
    AND A, #0F0H     ; Mask to check active columns
    RET

; Subroutine: MULTIPLE_KEYS
MULTIPLE_KEYS:
    MOV R2, A        ; Copy current key state
    MOV B, #00H      ; Initialize counter
    MOV C, #00H      ; Clear counter

CHECK_BITS:
    RRC A            ; Rotate to check each bit
    JC INC_COUNT     ; Increment count if bit is set
    DJNZ R2, CHECK_BITS ; Loop through all bits

INC_COUNT:
    INC B            ; Increment count
    MOV A, B
    CJNE A, #01H, MULTI_KEY_DETECTED ; Check if more than 1 key pressed
    CLR A            ; Single key detected
    RET

MULTI_KEY_DETECTED:
    MOV A, #01H      ; Multiple keys detected
    RET

; Subroutine: DISPLAY_HEX
DISPLAY_HEX:
    ; Convert R0 (key value) to BCD/HEX for 7-segment display
    ; Assume encoding lookup table is implemented
    MOV P0, R0       ; Output HEX value to P0 (7-segment)
    RET

END

