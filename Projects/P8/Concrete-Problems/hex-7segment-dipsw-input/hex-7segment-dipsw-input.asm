

ORG 0000H            ; Program start
SEGMENT_TABLE:
    DB 40H, 79H, 24H, 30H, 19H, 12H, 02H, 78H, 00H, 10H ; Hex to 7-segment (CA)

MAIN:
    MOV P2, #FFH      ; Configure P2 as input (DIP switch)
    MOV P0, #00H            ; Clear 7-segment display

DISPLAY_HEX:
    MOV A, P2         ; Read DIP switch value
    ANL A, #0FH       ; Mask upper nibble
    MOV DPTR, #SEGMENT_TABLE ; Point to segment table
    MOVC A, @A+DPTR   ; Get segment code
    CPL A             ; Invert for common anode
    MOV P0, A         ; Output to 7-segment display
    SJMP DISPLAY_HEX  ; Repeat
END
