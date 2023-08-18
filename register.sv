module reg_8 
(
input logic [7:0] Din,
input logic Clk,
input logic Load,
input logic Shift,
input logic ShiftVal,
input logic Reset,
output logic ShiftOut,
output logic [7:0] Dout
);

always_ff @ (posedge Clk or posedge Reset)
	begin
		if(Reset)
			Dout <= 8'h00;
		else if(Load)
			Dout <= Din;
		else if(Shift)
			begin
				Dout <= {ShiftVal, Dout[7:1]};
			end
	end
	
	assign ShiftOut = Dout[0];
	
endmodule

module reg_1
(
input logic din,
input logic clk,
input logic load,
input logic shift,
input logic shiftVal,
input logic reset,
output logic shiftOut,
output logic dout
);

always_ff @ (posedge clk or posedge reset)
	begin
		if(reset)
			dout <= 1'b0;
		else if(load)
			dout <= din;
		else if(shift)
			begin
				dout <= shiftVal;
			end
	end
	
	assign shiftOut = dout;
	
endmodule

