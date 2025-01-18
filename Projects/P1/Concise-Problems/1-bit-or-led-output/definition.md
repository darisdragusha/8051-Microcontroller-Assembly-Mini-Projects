**Objective**: Implement a logical function for a 1-bit output (`OUT`) based on several 1-bit inputs (`IN1`, `IN2`, etc.). The output should be displayed on a specified pin (e.g., `P1.0`) using an LED, and the inputs are provided via switches.

**Functionality**:

1. Inputs:
    - Connected to pins `P1.1` (IN1) and `P1.2` (IN2).
    - Logical HIGH corresponds to a closed switch.
    - Logical LOW corresponds to an open switch.
2. Output:
    - Logical function: OUT=IN1 OR IN2.
        
        OUT=IN1 OR IN2OUT = IN1 \ OR \ IN2
        
    - Output is displayed on `P1.0` using an LED.
3. Logic level interpretation:
    - LED lights up for HIGH output.