module blender (
	input [31:0] fg, bg,
	output [31:0] res);
	
	logic [15:0] alpha_input, red_input, green_input, blue_input;
	
	assign alpha_input = (fg[7:0] * 8'd255) + bg[7:0] * 8'(~fg[7:0]);
	
	assign red_input = fg[31:24] * fg[7:0] + bg[31:24] * 8'(~fg[7:0]);
	assign green_input = fg[23:16] * fg[7:0] + bg[23:16] * 8'(~fg[7:0]);
	assign blue_input = fg[15:8] * fg[7:0] + bg[15:8] * 8'(~fg[7:0]);
	
	div255 alpha (.x(alpha_input), .div(res[7:0]));
	div255 red (.x(red_input),	.div(res[31:24]));
	div255 green (.x(green_input), .div(res[23:16]));
	div255 blue (.x(blue_input), .div(res[15:8]));
	
endmodule

module div255 (
	input [15:0] x,
	output [7:0] div);
	
	assign div = 8'((x + 16'd1 + (x >> 8)) >> 8);
	
endmodule