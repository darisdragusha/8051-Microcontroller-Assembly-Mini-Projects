### **Concrete Problem Statement**

Develop an 8051 assembly program that utilizes the **74HC165 Parallel-In Serial-Out Shift Register** to expand the number of input pins. The program should:

1. **Input**:
    - Read 8-bit input from DIP switches connected to the **74HC165**.
    - Transfer the data serially into the microcontroller via **Port 2 pins**:
        - `P2.0` (Serial Out, `QH` from 74HC165),
        - `P2.1` (Clock, `SHCP` to shift data),
        - `P2.2` (Latch Enable, `PL` to latch inputs).
2. **Processing**:
    - Store the received data in the accumulator.
    - Process the input data for display.
3. **Output**:
    - Display the captured data using:
        - **LEDs**: Direct binary representation.
        - **7-segment display**: HEX equivalent of the input value, displayed on a **common cathode** (CC) display.
4. **Requirements**:
    - Data transfer and display update should occur when a push-button is pressed.
    - LEDs light up for `1` bits in the captured input.
    - The system must initialize the 74HC165 correctly for predictable operation.