# Problem 28 - Conversion of a Given Number with Specified Length and Base Unit to a Specified Output Unit

## Problem Statement

The task involves converting a given number with a specified length and base unit into a specified output unit (e.g., converting a binary number to BCD, etc.). The input and output base units can be **bit** (up to 8 bits in a byte), **byte**, **1 HEX in a byte**, **1 BCD in a byte**, or **2 BCD in a byte**. On a specified or freely chosen port, the selected base unit is displayed with its corresponding value. The selection of the base unit for display is generated using switches or DIP switches with specified or freely chosen connections. A closed switch represents a logical high level (H) at the input. The display will follow the specified method. If no base unit is selected, the length of the result, expressed in base units, will be displayed on the port.

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
- The input and output base units can be:
  - **Bit** (up to 8 bits in a byte).
  - **Byte**.
  - **1 HEX in a byte**.
  - **1 BCD in a byte**.
  - **2 BCD in a byte**.
- The selected base unit and its corresponding value are displayed on a specified or freely chosen port.
- The selection of the base unit for display is made using **switches** or **DIP switches**.
- A closed switch represents a logical high level (H) at the input.
- If no base unit is selected, the **length of the result** (expressed in base units) is displayed on the port.
- The logical level for turning on the LED can be chosen as per preference.
- The type of 7-segment display (CC or CA) can be selected based on preference.

