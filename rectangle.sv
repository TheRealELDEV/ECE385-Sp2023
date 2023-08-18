module rectangle (input frame_clk, Reset,
						input [12:0] startY,
						output [12:0] RectY
					  );

					  
	logic [12:0] RectYPos, Rect_Y_Motion;
	always_ff @ (posedge Reset or posedge frame_clk)
	begin
		if (Reset)
		begin
			Rect_Y_Motion <= 0;
			RectYPos <= startY;
		end
		else
		begin
			Rect_Y_Motion <= 1;
			RectYPos <= RectYPos + Rect_Y_Motion;
		end
	end
	
	assign RectY = RectYPos;
	
//	logic [ADDR_WIDTH-1:0] addr_reg;
//				
//	// ROM definition				
//	parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
//        8'b00000000, // 0
//        8'b00000000 // 1
//	};
//	
//	assign data = ROM[addr];
	
endmodule



