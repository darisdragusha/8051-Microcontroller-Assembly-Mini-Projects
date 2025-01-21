### Problem Description

**Title:** Sending ASCII Character Strings via Serial Port (TX) on 8051 Microcontroller

**Task Overview:**

This program implements a system where the 8051 microcontroller transmits a predefined ASCII character string via its serial port (TX). The transmitted character and the number of remaining characters to send are displayed using LEDs and a 7-segment display.

---

### **Detailed Requirements**

1. **Serial Transmission Setup**:
    - Serial communication will use the 8051's UART at a baud rate configured using Timer 1.
    - The string ends when the `00H` character (null terminator) is encountered.
    - The first byte of the string specifies the number of bytes in the sequence.
2. **Input Mechanism**:
    - A predefined string is stored in the data memory (using `DB` directive).
    - DIP switches or manual inputs are not utilized directly here but can be configured later for string selection.
3. **Outputs**:
    - LEDs indicate the transmission state:
        - Logical high (H) lights up corresponding LEDs connected to Port 2.
    - A 7-segment display connected to Port 1 shows:
        - The ASCII value of the character being transmitted.
4. **Control Flow**:
    - Transmit characters in sequence until the null terminator (`00H`) is reached.
    - Update LED and 7-segment displays after each character transmission.
    - Maintain a counter to track and display the remaining number of characters.