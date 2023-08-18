module register_unit
(
input logic Clk, Reset, Shift, Load_A, Load_B, Load_X, A_In, B_In, Xin, Xshift, Clr_Ld,
input logic [7:0] A_Din, B_Din,
output logic [7:0] A,
output logic [7:0] B,
output logic X, Xout, A_out, B_out 
);
	
	logic Ld_A, Ld_X, Xdata;
	logic [7:0] A_D;
	always_comb
	begin
		if(Clr_Ld)
		begin
			Ld_A = 1'b1;
			A_D = 8'h00;
			Ld_X = 1'b1;
			Xdata = 1'b0;
		end
		else
		begin
			Ld_A = Load_A;
			A_D = A_Din;
			Ld_X = Load_X;
			Xdata = Xin;
		end
	end
	
	reg_1 reg_X (.clk(Clk), .reset(Reset), .din(Xdata), .load(Ld_X), .shift(Shift), .shiftVal(Xshift), .dout(X), .shiftOut(Xout));
	
	reg_8 reg_A (.*, .Din(A_D), .Load(Ld_A), .ShiftVal(A_In), .Dout(A), .ShiftOut(A_out));
	
	reg_8 reg_B (.*, .Din(B_Din), .Load(Load_B), .ShiftVal(B_In), .Dout(B), .ShiftOut(B_out));
	
endmodule
