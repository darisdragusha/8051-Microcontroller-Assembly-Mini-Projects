

ORG 0000H           ; Start program
MAIN:
    MOV R2, #15H    ; Outer loop counter (3922 iterations ≈ 15H loops of inner loop)
OUTER_LOOP:
    MOV R3, #255    ; Inner loop counter
INNER_LOOP:
    NOP             ; Add 1 cycle (1 µs)
    DJNZ R3, INNER_LOOP ; Decrement inner counter
    DJNZ R2, OUTER_LOOP ; Decrement outer counter
    SJMP MAIN       ; Repeat the process (1-second delay)
END

