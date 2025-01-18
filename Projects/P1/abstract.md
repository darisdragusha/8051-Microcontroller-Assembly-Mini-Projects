# Task Specification: Logical Function and Display Implementation

## P1 - Realization of the Logical Function

Implement a logical function that produces a 1-bit output based on several 1-bit inputs. The output will be displayed on a specified pin (`Px.y`) or on a pin with free selection. The inputs can either be constant values from internal bits or values from specified pins (`Px.y`), or can be freely selected. Inputs will be activated via switches or DIP switches, and the output state will be displayed using an LED. A closed switch represents a logical high (H) level at the input, and an illuminated LED represents a high (H) level at the output.

### Requirements

1. **Inputs connected in such a way that the closed switch state sets the logical low (L) level at the input.**
2. **Inputs connected in such a way that the closed switch state sets the logical high (H) level at the input.**
3. **LED display:**
   - Use as many LEDs as needed.
   - The logical high (H) level of the counter should be displayed with an illuminated LED.
   - The logical level at which the LED lights up will be provided or selected according to the user's preference.
4. **7-Segment Display with BCD/HEX input.**
5. **7-Segment Display with input for each segment.**
6. **7-Segment Display with Common Cathode (CC).**
7. **7-Segment Display with Common Anode (CA).**
8. **7-Segment Display with either Common Cathode (CC) or Common Anode (CA), based on preference.**

---

