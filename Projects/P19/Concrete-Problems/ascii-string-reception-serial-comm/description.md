### Problem Statement: ASCII String Reception via Serial Communication

Design a program for the 8051 microcontroller to:

1. Receive a line of ASCII characters via serial communication (`RX`).
2. Detect the end of the string when **CR (0x0D)** and **LF (0x0A)** are received consecutively.
3. Display the **last received character** and the **current character count** on:
    - LEDs connected to a microcontroller port.
    - A 7-segment display (optional: BCD/HEX input, common cathode (CC), or common anode (CA)).
4. Input generation from DIP switches or an external terminal.

---

### Requirements

- **Serial Communication**: 9600 bps baud rate using Timer 1.
- **Clock Frequency**: 11.0592 MHz.
- **Input Sources**: DIP switches or terminal.
- **Display Options**:
    - **LEDs**: Display current character count and the last received character's bits.
    - **7-Segment Display**: Show character count or ASCII value of the last received character.