

ORG 0000H          ; Start of program
MAIN:
    MOV P1, #0C0H  ; Display "1" on P1
    MOV P2, #0F9H  ; Display "2" on P2
    MOV P3, #0A4H  ; Display "3" on P3
    MOV P0, #0B0H  ; Display "4" on P4

SCROLL:
    ; Shift all displays
    MOV A, P0      ; Save P0 in A
    MOV P0, P3     ; Move P3 to P4
    MOV P3, P2     ; Move P2 to P3
    MOV P2, P1     ; Move P1 to P2
    MOV P1, A      ; Move saved P4 to P1

    ACALL DELAY_TPERIOD ; Wait for T_Period

    SJMP SCROLL    ; Repeat the loop

; Subroutine for T_Period delay
DELAY_TPERIOD:
    MOV R0, #250   ; Example delay for T_Period
TPERIOD_LOOP:
    DJNZ R0, TPERIOD_LOOP
    RET

END
