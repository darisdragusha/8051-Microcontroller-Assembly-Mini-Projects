# Problem 19 - Receiving a Line of ASCII Characters from the RX of the Serial Port

## Problem Statement

The task involves receiving a line of ASCII characters from the **RX** of the serial port. The line ends upon receiving the character sequence **CR (0x0D)** and **LF (0x0A)**. The data is received either from a terminal or from the **TX** line, which transmits characters from the microcontroller's port. The last received character and the current number of received characters are displayed on the microcontroller ports using the required display method. Input data for transmission is generated using switches or DIP switches with specified or freely chosen connections. A closed switch represents a logical high level (H) at the input.

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
- The line of ASCII characters ends with the sequence **CR (0x0D)** and **LF (0x0A)**.
- Data can be received from a terminal or from the **TX** line of the microcontroller.
- The **last received character** and the **current number of received characters** are displayed on the microcontroller ports.
- Input data for transmission is generated using **switches** or **DIP switches**.
- A closed switch represents a logical high level (H) at the input.
- The logical level for turning on the LED can be chosen as per preference.
- The type of 7-segment display (CC or CA) can be selected based on preference.
