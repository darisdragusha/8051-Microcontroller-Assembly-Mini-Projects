### **Specification**

- **Shift Register Type**: 8-bit right-shift register with preset.
- **Control Signals**:
    - `P1.3`: Load preset (active high).
    - `P1.1`: Clock signal triggers shifting.
- **Preset Value**: `80H` (MSB = 1).
- **Output**: LEDs connected to `P2`.