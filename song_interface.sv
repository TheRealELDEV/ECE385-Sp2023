module song_interface
#(parameter MAX_BITS = 5000)
(
input frame_clk, Reset,
input [2:0] song_select,
output logic [6:0] numRectangles, 
output logic [MAX_BITS - 1:0] rectangles
);

logic [6:0] numRectanglesTTLS, numRectanglesHCB, numRectanglesOTJ, numRectanglesVLV, numRectanglesMHALL;
logic [1805:0] rectanglesTTLS;
logic [730:0] rectanglesHCB;
logic [1117:0] rectanglesMHALL;
logic [3052:0] rectanglesVLV;

HCB song1(.*, .numRectangles(numRectanglesHCB), .rectangles(rectanglesHCB));
MHALL song2(.*, .numRectangles(numRectanglesMHALL), .rectangles(rectanglesMHALL));
TTLS song3(.*, .numRectangles(numRectanglesTTLS), .rectangles(rectanglesTTLS));
VLV song5(.*, .numRectangles(numRectanglesVLV), .rectangles(rectanglesVLV));

always_comb
begin
	unique case (song_select)
		3'b001 : 
		begin
			numRectangles = numRectanglesHCB;
			rectangles = rectanglesHCB;
		end
		3'b010 : 
		begin
			numRectangles = numRectanglesMHALL;
			rectangles = rectanglesMHALL;
		end
		3'b011 :
		begin
			numRectangles = numRectanglesTTLS;
			rectangles = rectanglesTTLS;
		end
		3'b101 :
		begin
			numRectangles = numRectanglesVLV;
			rectangles = rectanglesVLV;
		end
	endcase
end

endmodule

