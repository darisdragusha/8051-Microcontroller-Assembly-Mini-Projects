# Problem 25 - Searching for a Given Word in One of the Provided Lines of ASCII Characters

## Problem Statement

The task involves searching for a given word in one of the provided lines of ASCII characters. Each line ends with the characters **CR (0x0D)** and **LF (0x0A)**. The end of the word is specified using one of the following methods. The selection of the line for searching is generated using switches or DIP switches with specified or freely chosen connections. A closed switch represents a logical high level (H) at the input. The starting position of the word in the searched line is displayed on a specified or freely chosen port in the specified manner. If the word is not found in the line, the position value will be **0 (zero)**.

### Requirements:
1. **Word Termination**:
   - The word ends with the character **00H**.
   - The first byte indicates the number of subsequent bytes that belong to the word.
2. **Input Connections**:
   - Inputs are connected such that the closed state of the switch sets the logical level to **L (low)** at the input.
   - Inputs are connected such that the closed state of the switch sets the logical level to **H (high)** at the input.
3. **Display Options**:
   - **LED Display** (use as many as needed) where the logical high level (H) of the bit corresponding to the state is indicated by a lit LED. The logical level at which the LED turns on can be provided or chosen as desired.
   - **7-Segment Display with BCD/HEX Input**
   - **7-Segment Display with Input for Each Segment**
   - **7-Segment Display with Common Cathode (CC)**
   - **7-Segment Display with Common Anode (CA)**
   - **7-Segment Display with CC or CA, as desired**

### Additional Notes:
- Each line of ASCII characters ends with the sequence **CR (0x0D)** and **LF (0x0A)**.
- The word to be searched can be terminated with the character **00H**, or the first byte can specify the length of the word.
- The selection of the line for searching is made using **switches** or **DIP switches**.
- A closed switch represents a logical high level (H) at the input.
- The **starting position of the word** in the searched line is displayed on a specified or freely chosen port.
- If the word is not found, the position value is **0**.
- The logical level for turning on the LED can be chosen as per preference.
- The type of 7-segment display (CC or CA) can be selected based on preference.
