### **Concrete Problem Statement**

Develop an 8051 microcontroller program to control **`n` LEDs**, where each LED has unique blink patterns based on user-defined parameters. Use a **timer** to generate precise delays. Parameters include:

1. **LED Configuration**:
    - Specify the number of LEDs (`n`).
    - Define the port where LEDs are connected (e.g., `P1`).
    - Assign the **logical level** for turning each LED **ON**:
        - **High (H)**: `1` for ON.
        - **Low (L)**: `0` for ON.
2. **Blinking Modes** (define the hardest cases):
    - **Mode 1**: Define `T_On` (ON time) and `T_Off` (OFF time) for each LED.
    - **Mode 2**: Define `T_Period` (total period) and `T_On` (ON time) for each LED.
    - **Mode 3**: Define `T_Period` (total period) and `T_Off` (OFF time) for each LED.
3. **Timer**:
    - Use **Timer 0** to implement delays.
    - Generate a **basic unit of time (`T_base`)** with the timer (e.g., 1 ms).
    - Derive all other times as multiples of `T_base`.