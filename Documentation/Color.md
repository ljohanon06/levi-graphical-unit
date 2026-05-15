# Color Documentation

## RGBA
In this project, RGBA32 is used to encode the colors and transparency.
8 bits (0 - 255) are used to encode each value, with 255 being full color and 0 being no color for RGB 
and 255 being full color. For the Alpha value, 0 represents transparent and 255 represents full color. 
In total 32 bits is used for each pixel color.

## Color Blending
It is often necessary to combine a foreground and a background color. 
The following formula are used where r represents resulting color, fg is foreground color, and bg is background color.

$$A_r = \frac{255 \cdot A_{fg} + A_{bg} \cdot (255-A_{fg})}{255}$$

$$C_r = \frac{C_{fg} \cdot A_{fg} + C_{bg} \cdot (255-A_{fg})}{255}$$

Since division is a resource and time heavy task, unless the divisor is a power of 2, it is best to avoid it. 
Since 255 is close to 256, we can approximate it by dividing by 256, which is represented by (x >> 8). 
The following formula is used for this approximation.
In addtion to this, 255 - x is the same as ~x for an 8 bit unsigned number.

$$\frac{x}{255} \approx (x + 1 + (x >> 8)) >> 8$$

The systemverilog module blender does this blending automatically.
