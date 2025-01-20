# Problem 16 - Connecting n LEDs to Microcontroller Ports and Blinking Them at Specified Rates

## Problem Statement

The task involves connecting **n LEDs** to the microcontroller ports and blinking each LED at a specified rate. The blinking is based on a base time obtained from one of the specified timers of the microcontroller. All times are expressed as multiples of this base time.

### Requirements:
1. **LED Connection**:
   - Specify how many LEDs will be connected and to which ports.
   - For each LED, specify the logical level at which it turns on:
     - LED turns on with a **logical high level (H)**.
     - LED turns on with a **logical low level (L)**.
2. **Blinking Timing**:
   - Provide **T_On** (time ON) and **T_Off** (time OFF) for each LED.
   - Provide **T_Period** (total period) and **T_On** (time ON) for each LED.
   - Provide **T_Period** (total period) and **T_Off** (time OFF) for each LED.

### Additional Notes:
- The base time for blinking is derived from one of the microcontroller's timers.
- All timing parameters (T_On, T_Off, T_Period) are multiples of the base time.
- The logical level for turning on the LED can be specified as high (H) or low (L).
