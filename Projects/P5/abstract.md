# Task Specification: LED Connection and Waveform Generation

## P5 - Connection of 1-8 LEDs to a Microcontroller Port and Generation of the Required Waveform for Each LED Individually

### Requirements:

1. **LED Connections:**
   - Specify how many LEDs (from 1 to 8) will be connected and to which port they will be connected.
   - All LEDs will turn on with the same logical level.

2. **LED Behavior:**
   - LEDs will turn on with a logical high (H) level.
   - LEDs will turn on with a logical low (L) level.

3. **Waveform Generation:**
   - The waveform is generated only once after the start of the program.
   - The waveform will restart after completing the required cycle.
   - The waveform will be generated `N_cikle` times.
   - The required waveform (one of the three possibilities mentioned above) will be generated if the specified condition is met.
   
4. **Condition for Generating Waveform:**
   - The condition will be expressed as a logical equation of the states of the microcontroller's port pins.
   - The logical equation can include AND, OR, NOT functions, and parentheses.

---

