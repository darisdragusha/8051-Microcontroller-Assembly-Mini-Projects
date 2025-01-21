### **Problem Description**

**Title:** Searching for a Given Word in a Row of ASCII Characters

**Objective:**

Develop software that searches for a specified word within a selected row of ASCII characters. The row ends with the characters **CR (0DH)** and **LF (0AH)**. The word termination and selection criteria are flexible, and the position of the word's start in the row is displayed on a specified output (port, LEDs, or 7-segment display). If the word is not found, the position is set to **0**.

---

### **Key Requirements**

1. **Word Termination Options:**
    - **Option 1:** The word ends with the null character **00H**.
    - **Option 2:** The first byte indicates the number of bytes belonging to the word.
2. **Input/Output Behavior:**
    - **Input Row Selection:** Controlled via DIP switches:
        - Closed switch → Logical High (H).
        - Open switch → Logical Low (L).
    - **Output for Position:**
        - Display the starting position of the word:
            - On a specified port.
            - On LEDs or a 7-segment display (configurable for CC or CA).
        - If the word is not found, the position output is **0**.
3. **Indicators:**
    - **LEDs:** Represent the logical state of each bit related to the position.
    - **7-Segment Display:** Show the word's starting position in decimal (BCD/HEX).
4. **Row Format:**
    - ASCII characters ending with **CR (0DH)** and **LF (0AH)**.