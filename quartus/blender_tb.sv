module blender_tb();

	logic [31:0] fg, bg;
	logic [31:0] res;
	
	logic [15:0] x;
	logic [7:0] div;
	
	blender b (.fg(fg), .bg(bg), .res(res));
	div255 d (.x(x), .div(div));
	
	
	task check_blend(input [31:0] f, input [31:0] b, input string desc);
		begin
			fg = f;
			bg = b;
			#10;
			$display("%s | FG: %H, BG: %H, Result: %H", desc, fg, bg, res);
		end
	endtask
	
	task check_divider(input [15:0] in);
		begin
			x = in;
			#10;
			$display("X: %d, X/255: %d", x, div);
		end
	endtask
	
	initial begin
		$display("Starting 10 division tests");
		
		check_divider(16'd0);
		check_divider(16'd100);
		check_divider(16'd254);
		check_divider(16'd255);
		check_divider(16'd256);
		check_divider(16'd510);
		check_divider(16'd65025);
		check_divider(16'd10000);
		check_divider(16'd1100);
		check_divider(16'd50000);
		
		$display("Division Tests over");	
		$display("Starting 10 blending tests");
		
		check_blend(32'hFF000000, 32'h00FF00FF, "T1 (FG Transp) ");
      check_blend(32'hFF0000FF, 32'h00FF00FF, "T2 (FG Opaque) ");
      check_blend(32'hFFFFFF80, 32'h000000FF, "T3 (50% White) ");
      check_blend(32'h000000FF, 32'hFFFFFFFF, "T4 (Black/White)");
      check_blend(32'h00000080, 32'h00000080, "T5 (Alpha Layer)");
      check_blend(32'hFFFFFF7F, 32'hFFFFFF7F, "T6 (White/White)");
      check_blend(32'h00000000, 32'h00000000, "T7 (All Zeros)  ");
      check_blend(32'hFF000080, 32'h0000FFFF, "T8 (Red/Blue)   ");
      check_blend(32'h00FF0080, 32'hFF0000FF, "T9 (Green/Red)  ");
      check_blend(32'hFEFEFEFE, 32'h01010101, "T10(Max Stress) ");
		
		$display("Blending Tests over");
		$stop;
	end
endmodule
		