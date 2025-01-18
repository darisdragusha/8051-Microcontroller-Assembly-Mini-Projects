

ORG 0000H          ; Start of program
MAIN:
    MOV P1, #00H   ; Turn off all LEDs initially
    MOV R0, #03H   ; Set N_cikle = 3

CHECK_CONDITION:
    ; Check if (P2.0 AND NOT P2.1) is true
    MOV A, P2
    JB ACC.0, CONDITION_TRUE   ; If P2.0 = 1
    SJMP WAIT_LOOP             ; Skip if P2.0 = 0
    JNB ACC.1, CONDITION_TRUE  ; If P2.1 = 0
WAIT_LOOP:
    SJMP WAIT_LOOP             ; Wait until condition is true

CONDITION_TRUE:
    ; Generate waveform for N_cikle
GEN_WAVEFORM:
    MOV P1, #0FH   ; Turn on LEDs P1.0–P1.3
    ACALL DELAY_TON
    MOV P1, #00H   ; Turn off LEDs
    ACALL DELAY_TOFF

    DJNZ R0, GEN_WAVEFORM      ; Repeat for N_cikle cycles

    SJMP $                    ; End program

; Subroutine for T_On delay
DELAY_TON:
    MOV R1, #250               ; Example delay value for T_On
TON_LOOP:
    DJNZ R1, TON_LOOP
    RET

; Subroutine for T_Off delay
DELAY_TOFF:
    MOV R2, #250               ; Example delay value for T_Off
TOFF_LOOP:
    DJNZ R2, TOFF_LOOP
    RET

END

