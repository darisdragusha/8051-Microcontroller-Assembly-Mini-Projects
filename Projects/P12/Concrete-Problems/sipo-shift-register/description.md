### **Concrete Problem Statement**

Develop an 8051 assembly program that demonstrates the use of the **4094 Serial-In Parallel-Out Shift Register** to extend the number of output pins for the microcontroller. The program should:

1. **Input**:
    - Read test data from DIP switches connected to **Port 1** (simulating a binary input).
2. **Processing**:
    - Send the data serially to the **4094 shift register** using **Port 2 pins**:
        - `P2.0` (Data In, `DS`)
        - `P2.1` (Clock, `STCP`)
        - `P2.2` (Latch, `SHCP`)
3. **Output**:
    - Use the shift register's parallel outputs to control:
        - **LEDs**: Binary representation of input.
        - **7-segment display**: Shows the input value as a HEX digit using a common cathode configuration.
4. **Behavior**:
    - LEDs light up for `1` bits in the register.
    - 7-segment display reflects the input as a HEX digit.
5. **Requirements**:
    - The input state must be read and displayed on demand by pressing a push button.
    - The system must initialize the shift register at startup to ensure predictable behavior.