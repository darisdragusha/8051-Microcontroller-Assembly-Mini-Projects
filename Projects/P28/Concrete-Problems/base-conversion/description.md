### **Problem Description**

**Title:** Conversion of a Number Between Input and Output Base Units

**Objective:**

Develop a program that converts a number provided with a specified **input base unit** and **length** to a chosen **output base unit**. The base units can include:

- **Bit** (up to 8 bits in a byte)
- **Byte**
- **1 HEX** per byte
- **1 BCD** per byte
- **2 BCDs** per byte

The result is displayed on specified ports using LEDs or a 7-segment display. If no base unit is selected, the program outputs the **result length** in the **default base unit**.

---

### **Key Requirements**

1. **Input/Output Behavior:**
    - **Base Unit Selection:**
        - Controlled via DIP switches.
        - Closed switch → Logical Low (L).
        - Open switch → Logical High (H).
    - **Number Length:** Provided as input.
2. **Output Display Options:**
    - Via:
        - **LEDs:** Logical High displayed as illuminated LEDs.
        - **7-Segment Displays:**
            - **BCD/HEX input**
            - Per-segment input
            - **CC or CA** (depending on configuration).
3. **Error Handling:**
    - If no base unit is selected, output the result's length in the default unit.