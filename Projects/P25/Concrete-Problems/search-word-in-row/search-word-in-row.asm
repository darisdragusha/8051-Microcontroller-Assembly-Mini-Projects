

ORG 0000H           ; Start of the program
MAIN:
    ; Initialize input/output ports
    MOV P1, #0FFH    ; Port 1 as input for row selection (DIP switches)
    MOV P2, #00H     ; Port 2 as output for position display
    MOV P3, #00H     ; Port 3 for LEDs

    ; Load row start address
    MOV DPTR, #ROW1  ; Example: Start with Row 1
ROW_SELECTION:
    MOV A, P1        ; Read DIP switches to select row
    CJNE A, #01H, ROW2
    MOV DPTR, #ROW2  ; Select Row 2 if switch value is 01H
    CJNE A, #02H, ROW3
    MOV DPTR, #ROW3  ; Select Row 3 if switch value is 02H
    ; Add more rows as needed
    SJMP SEARCH

SEARCH:
    ; Search for the word
    MOV R0, #00H     ; Initialize position counter
    CLR C            ; Clear Carry
    MOVX A, @DPTR    ; Load first character of the row
SEARCH_LOOP:
    CJNE A, #0DH, CONTINUE  ; Check for CR (end of row)
    SJMP NOT_FOUND
CONTINUE:
    ; Compare with the first character of the word
    MOVX A, @DPTR
    MOV R1, #WORD    ; Pointer to the word
    CALL COMPARE_WORD
    JC WORD_FOUND    ; Jump if word matches
    INC DPTR         ; Move to the next character in the row
    INC R0           ; Increment position counter
    SJMP SEARCH_LOOP

NOT_FOUND:
    ; Word not found, output 0
    MOV A, #00H
    MOV P2, A        ; Display 0 on 7-segment or port
    CLR P3.0         ; Turn off all LEDs
    SJMP END

WORD_FOUND:
    ; Word found, output position
    MOV A, R0        ; Load starting position
    MOV P2, A        ; Display position on 7-segment or port
    MOV P3.0, C      ; Light up corresponding LED
    SJMP END

COMPARE_WORD:
    ; Compare word with row starting from DPTR
    MOVX A, @R1      ; Load byte from word
    CJNE A, #00H, CONTINUE_COMPARE ; Check for null terminator
    CLR C            ; Set Carry if match found
    RET
CONTINUE_COMPARE:
    MOVX A, @DPTR    ; Load byte from row
    CJNE A, @R1, NOT_EQUAL
    INC R1           ; Move to the next character in the word
    INC DPTR         ; Move to the next character in the row
    SJMP COMPARE_WORD
NOT_EQUAL:
    SETB C           ; Set Carry if no match
    RET

END:
    SJMP END         ; End of program

; Define rows of ASCII characters
ROW1: DB 'HELLO WORLD', 0DH, 0AH
ROW2: DB 'ASSEMBLY CODE', 0DH, 0AH
ROW3: DB 'SEARCH WORD', 0DH, 0AH

; Define the word to search
WORD: DB 'CODE', 00H
END

