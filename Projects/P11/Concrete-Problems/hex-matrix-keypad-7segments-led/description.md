### **Concrete Problem Statement**

Design an assembly program for an 8051 microcontroller to read input from a **4x4 HEX matrix keypad**. Display the following:

1. **No Key Pressed**: Turn off all indicators (LEDs and 7-segment displays).
2. **Single Key Pressed**: Display the corresponding hexadecimal key value on both:
    - **LEDs** (binary representation).
    - A **7-segment display** (HEX representation).
3. **Multiple Keys Pressed**: Display a "minus sign" () on the 7-segment display.
4. **Keypad Organization**:
    - Rows connected to Port 1.
    - Columns connected to Port 2.
5. **7-Segment Display**:
    - Use a **common cathode** configuration.