### Problem Description:

**Title:** Implementation of a Cyclic Buffer for Serial Data Reception

The task involves programming a microcontroller to handle serial data communication using a cyclic buffer. The implementation includes receiving data bytes via the RX (receive) line of a serial port, storing these bytes in a cyclic buffer, and displaying relevant information, such as the last received byte and the current buffer count, using LEDs and a 7-segment display.

---

### **Detailed Requirements:**

1. **Serial Communication**:
    - Data is received via the RX line of the serial port.
    - A cyclic buffer stores the received data.
    - Serial communication is configured with a specified baud rate (e.g., 9600).
2. **Cyclic Buffer Functionality**:
    - The buffer operates in a circular manner, where the write pointer wraps to the start when it reaches the end.
    - The buffer size is fixed (e.g., 8 bytes).
    - New data overwrites the oldest data if the buffer is full.
3. **Inputs**:
    - Data is transmitted via the TX line or terminal to the RX line of the microcontroller.
    - Switches (DIP switches or toggle switches) are used to simulate additional inputs:
        - A closed switch represents a logical high (H).
        - An open switch represents a logical low (L).
4. **Outputs**:
    - **LED Display**:
        - The number of bytes currently in the cyclic buffer is displayed using LEDs.
        - Each bit of the buffer count corresponds to an LED. Logical high (H) lights up the LED.
    - **7-Segment Display**:
        - The last received byte is displayed on a 7-segment display.
        - The display can be configured to show:
            - Binary Coded Decimal (BCD) values.
            - HEX values.
            - Either common cathode (CC) or common anode (CA) configurations based on the requirement.
5. **Interrupt-Driven Data Handling**:
    - Serial data reception triggers an interrupt.
    - The interrupt service routine (ISR) handles storing the received byte in the buffer and updating the display.
6. **Buffer Management**:
    - Pointers manage the read and write positions within the buffer.
    - The buffer size is tracked to prevent overflows and ensure data integrity.
7. **Visualization of Data**:
    - Data received and buffer status are visualized in real-time using hardware indicators (LEDs and 7-segment displays).