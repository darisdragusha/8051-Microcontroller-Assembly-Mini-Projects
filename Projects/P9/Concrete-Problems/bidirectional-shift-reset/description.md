### **Specification**

- **Shift Register Type**: 8-bit bidirectional shift register with reset.
- **Control Signals**:
    - `P1.4`: Shift direction (1 = Left, 0 = Right).
    - `P1.3`: Reset (active high).
    - `P1.1`: Clock signal triggers shifting.
- **Output**: LEDs connected to `P2`.