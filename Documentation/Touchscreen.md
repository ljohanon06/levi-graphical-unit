# Touchscreen

There is a 4 wire resistive touchscreen on the TFT screen with 4 pins: XR, XL, YU, and YD. 
These are connected to metal strips at the sides of the screen, and between the strips are two resistive screens. 
By applying a voltage between XR and XL, a voltage gradient is formed across the screen. When the screen is touched, the two resistive screens hit eachother. 
At this point, if the voltage is measured at YU and YD is left as high impedance, the voltage at YU is the horizontal distance of the touch.
By repeating this step with a voltage between YU and YD, then measuring at XR, the vertical distance of the touch can be found.

Because when there isn't a touch, the measured voltage is inconsistent due to being floating. To fix this, first both XR and XL are set to ground, 
then a 100k pullup resistor pulls YU to 3.3 V. Because the resistance of the touchscreen is less than 1k, a touch will pull YU down to ground, 
this can be detected and then the location can be measured.

To measure, a 2 channel ADC is used (MCP3202-CI/P). While the DE10-Lite does have a built in ADC, I would rather use a seperate one.
