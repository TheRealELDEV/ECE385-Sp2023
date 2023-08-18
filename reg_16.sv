module reg_16
(
input Clk, Reset,
input logic [15:0] Din,
input Load,
output logic [15:0] Dout
);

always_ff @ (posedge Clk)
begin
	if(Reset)
		Dout <= 16'h0000;
	else if(Load)
		Dout <= Din;
end
	
endmodule

module reg_3
(
input Clk, Reset,
input logic [2:0] Din,
input Load,
output logic [2:0] Dout
);

always_ff @ (posedge Clk)
begin
	if(Reset)
		Dout <= 3'b000;
	else if(Load)
		Dout <= Din;
end

endmodule

module flipflop
(
input Clk, Reset, Load,
input logic Din,
output logic Dout
);

always_ff @ (posedge Clk)
begin
	if(Reset)
		Dout <= 1'b0;
	else if(Load)
		Dout <= Din;
end

endmodule



