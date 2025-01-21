# Problem 23 - Implementation of a Circular Buffer for Sending Data to the TX of the Serial Port

## Problem Statement

The task involves implementing a **circular buffer** for sending data to the **TX** of the serial port. The data is taken from one of the predefined strings. The selection of the string is made using inputs from a specified or freely chosen port of the microcontroller. The character being sent and the number of characters in the buffer are displayed on the microcontroller ports using the required display method. The selection of the data for transmission is generated using switches or DIP switches with specified or freely chosen connections. A closed switch represents a logical high level (H) at the input.

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
- A **circular buffer** is implemented to send data to the **TX** of the serial port.
- The data is taken from one of the **predefined strings**.
- The selection of the string for transmission is made using **switches** or **DIP switches**.
- A closed switch represents a logical high level (H) at the input.
- The **character being sent** and the **number of characters in the buffer** are displayed on the microcontroller ports.
- The logical level for turning on the LED can be chosen as per preference.
- The type of 7-segment display (CC or CA) can be selected based on preference.
