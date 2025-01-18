

ORG 0000H           ; Program start
MAIN:
    MOV TMOD, #02H  ; Timer 0 Mode 2 (8-bit auto-reload)
    MOV TH0, #80H   ; Load reload value (calculated for 7.5 ms)
    SETB TR0        ; Start Timer 0
    MOV R6, #133    ; Number of cycles (N_cycles)

TIMER_LOOP:
    JNB TF0, TIMER_LOOP ; Wait for Timer 0 overflow
    CLR TF0        ; Clear Timer 0 overflow flag
    DJNZ R6, TIMER_LOOP ; Decrement cycle count and loop

    SJMP $          ; End program in infinite loop
END

