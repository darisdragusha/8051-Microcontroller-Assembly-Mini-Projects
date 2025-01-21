### Problem Description

**Title:** Software Implementation of Byte Transmission for 8PS Serial Communication

**Objective:**

Develop a software implementation for transmitting bytes over serial communication with the following specifications:

- **8PS Format:** 8-bit word, parity bit (Odd or Even), and configurable stop bits (1 or 2).
- Transmission starts with a **Start-bit** and ends with one or two **Stop-bits**.
- The byte is sent on a specified pin (e.g., Px.y).
- Bytes for transmission are sourced either from the microcontroller's ports or from a connected terminal via RX.
- A rising edge on a specific pin (e.g., Pp.q) signals the start of the byte transmission.
- The bit being transmitted is optionally displayed on an LED or a 7-segment display.

---

### Detailed Requirements

1. **Transmission Format**
    - Start-bit: Logical Low (0).
    - Data bits: 8 bits (Least Significant Bit first).
    - Parity bit: Configurable as **Odd** or **Even**.
    - Stop-bit(s): Configurable as **1** or **2** Logical High (1).
2. **Data Source**
    - Bytes are read either from RX (serial input) or a port on the microcontroller.
3. **Indicators**
    - **LEDs:** Display the logical state (High/Low) of the current bit being transmitted.
    - **7-Segment Displays:** Show:
        - The transmitted byte (ASCII/HEX).
        - The parity bit and the number of stop bits used.
4. **Input Logic**
    - Inputs via DIP switches:
        - Closed switch → Logical High (H).
        - Open switch → Logical Low (L).
5. **Output Display**
    - LEDs show the logical state of the bit being transmitted.
    - 7-segment displays use either Common Cathode (CC) or Common Anode (CA).