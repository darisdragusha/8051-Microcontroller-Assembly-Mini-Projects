

ORG 0000H          ; Start of program
MAIN:
    MOV P1, #0C0H  ; Display "3" on 7-segment at P1 (CC)
    MOV P2, #092H  ; Display "5" on 7-segment at P2 (CC)
    MOV P3, #080H  ; Display "8" on 7-segment at P3 (CC)

    SJMP $         ; Infinite loop to hold the display

END

