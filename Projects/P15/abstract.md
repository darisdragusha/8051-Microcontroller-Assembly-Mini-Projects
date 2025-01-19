# Problem 15 - Display on an 8x8 LED Matrix Display

## Problem Statement

The task involves displaying one of the predefined patterns on an 8x8 LED matrix display. The matrix will be connected to two specified or freely chosen ports. One of the predefined patterns (N_disp) will be displayed on the matrix. The implementation of multiplexing and the selection of the pattern can be done using one of the methods mentioned below.

### Requirements:
1. **Multiplexing Implementation**:
   - Multiplexing implemented using time delays.
   - Multiplexing implemented using interrupts.
2. **Switch Selection**:
   - A switch to select one pattern. When the switch is Off, the display is turned off.
   - A switch to select one of two patterns, depending on the On or Off state.
   - 1 to 8 switches to select 1 out of 1 to 8 predefined patterns. If no pattern is selected, the display is turned off. If two or more patterns are selected simultaneously, the behavior will be as specified.
3. **Display Behavior**:
   - Display the first selected pattern.
   - Display the last selected pattern.
   - Display the patterns one after the other in a cyclic manner, with each pattern displayed for 1 second.
   - Display the first pattern blinking at a rate of 4 Hz (4 on/off cycles per second).

### Additional Notes:
- The **8x8 LED matrix** is connected to two specified or freely chosen ports of the microcontroller.
- The multiplexing method can be implemented using **time delays** or **interrupts**.
- The behavior of the display when multiple patterns are selected simultaneously should follow the specified rules.
