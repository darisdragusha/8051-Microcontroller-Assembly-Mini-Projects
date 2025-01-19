# Problem 14 - Display on a 4-Digit 7-Segment Display with 4x8 Matrix Organization

## Problem Statement

The task involves displaying a 4-digit number on a 4-digit 7-segment display with a 4x8 matrix organization. The matrix will be connected to two specified or freely chosen ports. One of the predefined 4-digit numbers (N_disp) will be displayed on the display. The implementation of multiplexing and the selection of the number can be done using one of the methods mentioned below. The 7-segment displays can be either common anode (CA) or common cathode (CC), as specified or freely chosen.

### Requirements:
1. **Multiplexing Implementation**:
   - Multiplexing implemented using time delays.
   - Multiplexing implemented using interrupts.
2. **Switch Selection**:
   - A switch to select one number. When the switch is Off, the display is turned off.
   - A switch to select one of two numbers, depending on the On or Off state.
   - 1 to 8 switches to select 1 out of 1 to 8 predefined 4-digit numbers. If no number is selected, the display is turned off. If two or more numbers are selected simultaneously, the behavior will be as specified.
3. **Display Behavior**:
   - Display the first selected number.
   - Display the last selected number.
   - Display the numbers one after the other in a cyclic manner, with each number displayed for 1 second.
   - Display the first number blinking at a rate of 4 Hz (4 on/off cycles per second).

### Additional Notes:
- The 7-segment displays can be either common anode (CA) or common cathode (CC), as specified or freely chosen.
- The matrix is connected to two specified or freely chosen ports of the microcontroller.
- The multiplexing method can be implemented using time delays or interrupts.
- The behavior of the display when multiple numbers are selected simultaneously should follow the specified rules.
