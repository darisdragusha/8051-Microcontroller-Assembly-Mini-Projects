# P9 - Shift Register Implementation with Display

### **Description:**

Implement the required shift register functionality with a given number of bits (1-8 bits) in the specified microcontroller register and display the result accordingly. Control signals will be used as necessary, and the location for functional units and control signals can be either predefined or selected from the available microcontroller resources.

- **Serial Input and Parallel Output**
- **Parallel Input and Serial Output**
- **Left Shift with Reset**
- **Right Shift with Reset**
- **Bidirectional Shift (Left/Right) with Reset**
- Any of the above types with 1 or more presets.
- The preset values are defined in the code.
- The preset values can be read from external sources. The location from which the values are obtained can be specified or taken from available microcontroller resources. The value can be provided by a switch or DIPSW.
- **LED Display**: Use as many LEDs as necessary so that the logic level H of the shift register is displayed with the LED on. The logic level with which the LED turns on can be either specified or selected as desired.
- **7-Segment Display**:
    - Display with BCD/HEX input.
    - Display with input for each segment.
    - Common Cathode (CC) 7-segment display.
    - Common Anode (CA) 7-segment display.
    - Use either CC or CA display as required.
