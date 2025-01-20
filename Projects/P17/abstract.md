# Problem 17 - Implementation of a Specified State-Based Program Using a Universal Structure

## Problem Statement

The task involves implementing a specified state-based program using a universal structure suitable for programs of this type. Transitions between states can be triggered by either the passage of time or inputs from ports in the form of 1-bit or 8-bit information. The input information is generated using switches or DIP switches with specified or freely chosen connections. A closed switch represents a logical high level (H) at the input. The current state of the program is displayed on a specified or freely chosen port in the specified form.

### Requirements:
1. **Input Connections**:
   - Inputs are connected such that the closed state of the switch sets the logical level to **L (low)** at the input.
   - Inputs are connected such that the closed state of the switch sets the logical level to **H (high)** at the input.
2. **Display Options**:
   - **LED Display** (use as many as needed) where the logical high level (H) of the bit corresponding to the state is indicated by a lit LED. The logical level at which the LED turns on can be provided or chosen as desired.
   - **7-Segment Display with BCD/HEX Input**
   - **7-Segment Display with Input for Each Segment**
   - **7-Segment Display with Common Cathode (CC)**
   - **7-Segment Display with Common Anode (CA)**
   - **7-Segment Display with CC or CA, as desired**

### Additional Notes:
- The program is state-based, and transitions between states can be triggered by:
  - The passage of time.
  - Inputs from ports (1-bit or 8-bit information).
- Inputs are generated using switches or DIP switches.
- The current state of the program is displayed on a specified or freely chosen port.
- The logical level for turning on the LED can be chosen as per preference.
- The type of 7-segment display (CC or CA) can be selected based on preference.
