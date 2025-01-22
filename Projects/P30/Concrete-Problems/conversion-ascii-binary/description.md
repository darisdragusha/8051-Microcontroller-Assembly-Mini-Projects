### **Problem Description**

**Title:** Conversion of ASCII Characters to Binary Numbers

**Objective:**

Create a program that:

1. **Converts an ASCII string** (representing a number) into a **binary number** of appropriate length.
2. Interprets the **numerical base** from the last character in the string (`B`, `O`, `D`, `H`) or defaults to decimal (`D`).
3. Detects the **end of the number** using specific delimiters: space, comma, tab, semicolon, CR, or LF.
4. Outputs the **byte of length** in bytes on a specified port or selectable via **DIP switches**.
5. If an error occurs during conversion, the length byte is set to **0**.

---

### **Key Features**

1. **Input Handling:**
    - Input is a string of ASCII characters representing a number.
    - The program identifies the base (`B`, `O`, `D`, `H` for binary, octal, decimal, hexadecimal).
2. **Output Display Options:**
    - Display the result or the byte length via:
        - LEDs (logical High = LED on).
        - 7-segment display (BCD or segment-based input).
        - Common Cathode (CC) or Common Anode (CA).
3. **Error Handling:**
    - If conversion fails (e.g., invalid characters), the **length byte** is set to **0**.