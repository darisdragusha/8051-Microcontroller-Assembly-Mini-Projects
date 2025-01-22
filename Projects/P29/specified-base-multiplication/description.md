### **Problem Description**

**Title:** Multiplication of Numbers with Specified Length and Base Unit

**Objective:**

Implement a program to perform **multiplication** of two given numbers, each defined with a **specified length** and **base unit**. The base units include:

- **Bit** (up to 8 bits in a byte)
- **Byte**
- **1 HEX** per byte
- **1 BCD** per byte
- **2 BCDs** per byte

The result is displayed on a **specified port** or selected **freely** via DIP switches. If no base unit is chosen, the program outputs the **result length** expressed in the default base unit.

---

### **Key Requirements**

1. **Input/Output Specifications:**
    - Two input numbers and their **base units** are provided.
    - **DIP switches** (connected to a port) allow selection of the **base unit** for the result.
2. **Output Display Options:**
    - **LEDs:** Logical High values are displayed as illuminated LEDs.
    - **7-Segment Displays:**
        - **BCD/HEX input**
        - **Per-segment input**
        - **Common Cathode (CC)** or **Common Anode (CA)**.
3. **Error Handling:**
    - If no base unit is selected, display the **result length** in the default base unit.