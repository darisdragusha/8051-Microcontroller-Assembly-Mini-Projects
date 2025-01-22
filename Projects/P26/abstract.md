# Problem 26 - Searching for a Given Word in a Provided List of ASCII Words

## Problem Statement

The task involves searching for a given word in a provided list of ASCII words. The list ends with a word that starts with **00H**, signaling the end of the list. The end of the word is specified using one of the following methods, both for the words in the list and for the word being searched. The selection of the list for searching is generated using switches or DIP switches with specified or freely chosen connections. A closed switch represents a logical high level (H) at the input. The position of the word in the searched list is displayed on a specified or freely chosen port in the specified manner. If the word is not found in the list, the position value will be **0 (zero)**.

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
- The list of ASCII words ends with a word that starts with **00H**, signaling the end of the list.
- The word to be searched and the words in the list can be terminated with the character **00H**, or the first byte can specify the length of the word.
- The selection of the list for searching is made using **switches** or **DIP switches**.
- A closed switch represents a logical high level (H) at the input.
- The **position of the word** in the searched list is displayed on a specified or freely chosen port.
- If the word is not found, the position value is **0**.
- The logical level for turning on the LED can be chosen as per preference.
- The type of 7-segment display (CC or CA) can be selected based on preference.
