module i2s
(
input SCLK,
input LRCLK, 
input [31:0] Din,
output logic Dout
);

logic [31:0] left, right;

always_ff @ (posedge SCLK)
begin
	if(LRCLK)
	begin
		left <= Din;
		Dout <= right[31];
		right <= {right[30:0], 1'b0};
	end
	else
	begin
		right <= Din;
		Dout <= left[31];
		left <= {left[30:0], 1'b0};
	end
end

endmodule


	