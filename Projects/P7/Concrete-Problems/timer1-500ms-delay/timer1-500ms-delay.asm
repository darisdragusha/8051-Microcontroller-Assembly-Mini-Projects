

ORG 0000H           ; Program start
MAIN:
    MOV TMOD, #10H  ; Timer 1 Mode 1 (16-bit timer)
    MOV TH1, #0D8H  ; Load high byte for 10 ms delay
    MOV TL1, #0F0H  ; Load low byte for 10 ms delay
    SETB TR1        ; Start Timer 1
    MOV R7, #50     ; Number of cycles (N_cycles = 50)

TIMER_WAIT:
    JNB TF1, TIMER_WAIT ; Wait for Timer 1 overflow
    CLR TF1        ; Clear Timer 1 overflow flag
    MOV TH1, #0D8H ; Reload high byte
    MOV TL1, #0F0H ; Reload low byte
    DJNZ R7, TIMER_WAIT ; Decrement cycle count and loop

    SJMP $          ; End program in infinite loop
END

