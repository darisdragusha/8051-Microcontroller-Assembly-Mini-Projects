### **Specification**

- **Counter Type**: 4-bit BCD down counter with reset.
- **Register Used**: Use register `R7` for counting.
- **Reset Control**: Use `P1.1` to reset the counter when `P1.1 = 1`.
- **Display**: 7-segment display with common cathode connected to `P0`.

### **Display Mapping**

The BCD values for a common cathode 7-segment display are mapped as:
| BCD Value | Segments (a-g) in Hex |
| --- | --- |
| 0 | `3F` |
| 1 | `06` |
| 2 | `5B` |
| 3 | `4F` |
| 4 | `66` |
| 5 | `6D` |
| 6 | `7D` |
| 7 | `07` |
| 8 | `7F` |
| 9 | `6F` |