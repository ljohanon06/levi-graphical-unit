# Hardware

### Materials
- Display: 5.0" 40-pin TFT Display - 800x480 with Touchscreen, from Adafruit: 1596. 

- TFT 40 Pin Adapter: 40-pin TFT Friend - FPC Breakout with LED Backlight Driver, from Adafruit 1932. 
It has a built in boost converter because the display backlight requires 20V.

- FPGA Board: DE10-Lite. Developement board with plenty of exposed GPIO pins, as well as LEDs and switches for testing.

- Custom PCB to adapt from the TFT 40 Pin Adapter to the DE10-Lite. The DE10-Lite has a 40 pin GPIO header which will be used to connect to the screen.

### TFT Pinout Information
<img src="assets/TFT_Friend_Pinout.jpg" alt="Picture of TFT Friend with labeled pins]" width="50%">

- RGB: There is an 8 bit channel for the red, green, and blue colors totalling 24 pins. Alpha is ignored when sending pixel data to the screen.

- hi
