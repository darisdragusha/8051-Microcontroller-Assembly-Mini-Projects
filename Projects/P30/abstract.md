# Problem 30 - Conversion of a Given Number in ASCII Characters to a Binary Number of Appropriate Length and a Byte Representing the Length in Bytes

## Problem Statement

The task involves converting a given number represented in ASCII characters into a binary number of the appropriate length and a byte representing the length in bytes. The last character (**B**, **O**, **D**, or **H**) determines the numeric base of the number. If this character is missing, it is assumed to be **D** (decimal). The end of the number is signaled by one of the following characters: space, comma, tab, semicolon, **CR**, or **LF**. If errors are encountered during the conversion, the length byte will have a value of zero. On a specified or freely chosen port, the selected byte is displayed with its corresponding value. The selection of the byte for display is generated using switches or DIP switches with specified or freely chosen connections. A closed switch represents a logical high level (H) at the input. The display will follow the specified method. If no byte is selected, the length of the result, expressed in bytes, will be displayed on the port.

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
- The last character in the ASCII representation determines the numeric base:
  - **B**: Binary.
  - **O**: Octal.
  - **D**: Decimal (default if no character is provided).
  - **H**: Hexadecimal.
- The end of the number is signaled by one of the following characters: space, comma, tab, semicolon, **CR**, or **LF**.
- If errors are encountered during the conversion, the length byte will have a value of **0**.
- The selected byte and its corresponding value are displayed on a specified or freely chosen port.
- The selection of the byte for display is made using **switches** or **DIP switches**.
- A closed switch represents a logical high level (H) at the input.
- If no byte is selected, the **length of the result** (expressed in bytes) is displayed on the port.
- The logical level for turning on the LED can be chosen as per preference.
- The type of 7-segment display (CC or CA) can be selected based on preference.
