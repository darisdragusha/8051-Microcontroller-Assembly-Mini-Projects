
ORG 0000H           ; Start of the program
MAIN:
    ; Initialize input/output ports
    MOV P1, #0FFH    ; Port 1 as input for list selection (DIP switches)
    MOV P2, #00H     ; Port 2 as output for position display
    MOV P3, #00H     ; Port 3 for LEDs

    ; Load list start address
    MOV DPTR, #LIST1 ; Example: Start with List 1
LIST_SELECTION:
    MOV A, P1        ; Read DIP switches to select list
    CJNE A, #01H, LIST2
    MOV DPTR, #LIST2 ; Select List 2 if switch value is 01H
    CJNE A, #02H, LIST3
    MOV DPTR, #LIST3 ; Select List 3 if switch value is 02H
    ; Add more lists as needed
    SJMP SEARCH

SEARCH:
    ; Search for the word in the list
    MOV R0, #01H     ; Initialize position counter (list index starts at 1)
    CLR C            ; Clear Carry
SEARCH_LOOP:
    MOVX A, @DPTR    ; Load the first byte of the current word
    CJNE A, #00H, CONTINUE  ; Check if word starts with 00H (end of list)
    SJMP NOT_FOUND

CONTINUE:
    MOV R1, #WORD    ; Pointer to the search word
    CALL COMPARE_WORD
    JC WORD_FOUND    ; Jump if word matches
    ; Move to the next word
    MOVX A, @DPTR    ; Load the word length from the first byte
    ADD A, #01H      ; Add 1 to skip to the next word
    ADD A, DPTR
    MOV DPTR, A
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
    MOV A, R0        ; Load position
    MOV P2, A        ; Display position on 7-segment or port
    MOV P3.0, C      ; Light up corresponding LED
    SJMP END

COMPARE_WORD:
    ; Compare word with the current word in the list
    MOVX A, @DPTR    ; Load length of the current word
    MOV R2, A        ; Save length in R2
    INC DPTR         ; Point to the first character
COMPARE_LOOP:
    CJNE R2, #00H, CONTINUE_COMPARE ; Check if all characters are compared
    CLR C            ; Word matches
    RET
CONTINUE_COMPARE:
    MOVX A, @R1      ; Load character from search word
    CJNE A, @DPTR, NOT_EQUAL
    INC R1           ; Move to the next character in the search word
    INC DPTR         ; Move to the next character in the list word
    DEC R2           ; Decrement remaining length
    SJMP COMPARE_LOOP
NOT_EQUAL:
    SETB C           ; Set Carry if no match
    RET

END:
    SJMP END         ; End of program

; Define lists of ASCII words
LIST1: DB 04H, 'WORD', 03H, 'ONE', 05H, 'HELLO', 00H
LIST2: DB 05H, 'WORLD', 03H, 'TWO', 06H, 'NUMBER', 00H
LIST3: DB 04H, 'TEXT', 03H, 'THREE', 06H, 'SEARCH', 00H

; Define the word to search
WORD: DB 04H, 'WORD'
END

