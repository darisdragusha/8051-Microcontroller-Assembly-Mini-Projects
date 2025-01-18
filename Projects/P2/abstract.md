# Task Specification: 8-Bit Logical Function Implementation

## P2 - Realization of the Logical Function for an 8-Bit Output

Implement a logical function for an 8-bit output based on several 8-bit inputs. The output will be displayed on a specified port or on a port with free selection. The inputs can either be constant values from internal registers or values from ports, either specified or with free selection. Inputs will be activated via switches or DIP switches, and the output state will be displayed using LEDs. A closed switch represents a logical high (H) level at the input, and an illuminated LED represents a high (H) level at the output.

### Requirements

1. **Inputs connected in such a way that the closed switch state sets the logical low (L) level at the input.**
2. **Inputs connected in such a way that the closed switch state sets the logical high (H) level at the input.**
3. **LED display:**
   - Use as many LEDs as needed.
   - The logical high (H) level of the counter should be displayed with an illuminated LED.
   - The logical level with which the LED lights up will be provided or selected according to the user's preference.
4. **Display with 7-segment indicator using BCD/HEX input.**
5. **Display with 7-segment indicator using input for each segment.**
6. **7-segment display with common cathode (CC).**
7. **7-segment display with common anode (CA).**
8. **7-segment display with either common cathode (CC) or common anode (CA), based on preference.**

---

