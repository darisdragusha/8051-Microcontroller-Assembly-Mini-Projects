### **Specification**

- **Counter Type**: 8-bit up/down counter with preset value.
- **Register Used**: Use register `R6` for counting.
- **Control**:
    - **Up/Down**: Use `P1.2` (1 = Up, 0 = Down).
    - **Preset**: Use `P1.3` to load preset value when `P1.3 = 1`.
- **Preset Value**: `50H` (Preset loaded when `P1.3` is triggered).
- **Display**: LEDs connected to `P3`.
