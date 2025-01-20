# Problem 18 - Implementation of ECHO Functionality on the Serial Port

## Problem Statement

The task involves implementing the **ECHO functionality** on the serial port, where the data received on **RX** is transmitted back on **TX**. The serial terminal will be connected to **TX** and **RX**, or the data can be taken from one port and displayed on another port of the microcontroller. A combined form of the two cases may also be required, where one (RX or TX) is of one type and the other is of the other type. The clock frequency, communication speed, and the microcontroller timer to be used will be specified. Input data for transmission is generated using switches or DIP switches with specified or freely chosen connections. A closed switch represents a logical high level (H) at the input. The received data is displayed on a specified or freely chosen port in the specified form.

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
- The **ECHO functionality** involves transmitting the data received on **RX** back on **TX**.
- The serial terminal can be connected to **TX** and **RX**, or data can be taken from one port and displayed on another port.
- Input data for transmission is generated using **switches** or **DIP switches**.
- A closed switch represents a logical high level (H) at the input.
- The received data is displayed on a specified or freely chosen port.
- The logical level for turning on the LED can be chosen as per preference.
- The type of 7-segment display (CC or CA) can be selected based on preference.
