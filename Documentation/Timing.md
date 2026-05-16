# Timing

### Basics and Porches

There is 3 pins (technically 4) that control the timing of the TFT display: Clock, HSYNC, and VSYNC. For the TFT display, the pixels are sent one at a time. This data is captured or latched in at the rising edge of the clock pin. After all 800 pixels in one line is loaded into the TFT display, the HSYNC signal is sent to load that row onto the display. This process is repeated for all 480 rows. After all 480 rows have been loaded in, the VSYNC signal is sent which resets the row counter back to the first. 

There is delays between the data being sent for one row and the next known as porches. This gives time for the sent data to actually be loaded into the pixels and for everything to reset, for old CRT displays this gave time for the laser gun to move back to the start. The data is sent, then there is a front porch, the HSYNC signal is sent, then there is the back porch before more data is sent. There is also VSYNC porches. 

<img src="assets/Porch_Image.jpg" alt="Picture of TFT Friend with labeled pins]" width="50%">
Source: [RS DesignSpark](https://www.rs-online.com/designspark/lcd-tft-displays-timing-parameters-explained)

CLK: Data is loaded on the rising edge

HSYNC: Active Low. After 800 pixels are loaded in, the HSYNC goes low to trigger the next line.

VSYNC: Active Low. After all 480 lines are loaded in, the VSYNC goes low to go back to the top.

Porches: After the video data is sent, there is a front porch, the HSYNC, then the back porch. The porches give time for the reset to happen.

