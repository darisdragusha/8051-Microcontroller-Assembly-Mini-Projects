### **Problem Description**

**Title:** Searching for a Given Word in a List of Words Using ASCII Characters

**Objective:**

Develop software to search for a specified word in a given list of ASCII words. The list ends with a word starting with **00H** (null character). The output is the position of the word in the list, displayed via ports, LEDs, or 7-segment displays. If the word is not found, the position output is **0**.

---

### **Key Requirements**

1. **Word and List Format:**
    - The **list** ends with a word starting with **00H**.
    - The **word termination** is defined by:
        - Ending with a null character **00H**.
        - First byte indicating the number of bytes in the word.
2. **Input/Output Behavior:**
    - **List Selection:**Controlled via DIP switches:
        - Closed switch → Logical High (H).
        - Open switch → Logical Low (L).
    - **Output:**
        - Display the word's position in the list via:
            - A specified port.
            - LEDs or 7-segment displays (CC or CA).
        - If the word is not found, the output is **0**.
3. **Indicators:**
    - **LEDs:** Display logical state corresponding to the position.
    - **7-Segment Display:** Show the position in BCD/HEX.