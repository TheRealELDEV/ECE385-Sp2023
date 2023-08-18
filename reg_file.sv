module reg_file
(
input Clk, Reset, LD_REG,
input logic [2:0] SR1, SR2, DR,
input logic [15:0] Din,
output logic [15:0] SR1OUT, SR2OUT
);

logic LD_R0, LD_R1, LD_R2, LD_R3, LD_R4, LD_R5, LD_R6, LD_R7;
logic [15:0] R0, R1, R2, R3, R4, R5, R6, R7;

always_comb
begin
	LD_R0 = 1'b0;
	LD_R1 = 1'b0;
	LD_R2 = 1'b0;
	LD_R3 = 1'b0;
	LD_R4 = 1'b0;
	LD_R5 = 1'b0;
	LD_R6 = 1'b0;
	LD_R7 = 1'b0;
	case(SR1)
		3'b000 :
			SR1OUT = R0;
		3'b001 :
			SR1OUT = R1;
		3'b010 :
			SR1OUT = R2;
		3'b011 :
			SR1OUT = R3;
		3'b100 :
			SR1OUT = R4;
		3'b101 :
			SR1OUT = R5;
		3'b110 :
			SR1OUT = R6;
		3'b111 :
			SR1OUT = R7;
		default : ;
	endcase
	case(SR2)
		3'b000 :
			SR2OUT = R0;
		3'b001 :
			SR2OUT = R1;
		3'b010 :
			SR2OUT = R2;
		3'b011 :
			SR2OUT = R3;
		3'b100 :
			SR2OUT = R4;
		3'b101 :
			SR2OUT = R5;
		3'b110 :
			SR2OUT = R6;
		3'b111 :
			SR2OUT = R7;
		default : ;
	endcase
	case(LD_REG)
		1'b1 :
			case(DR)
				3'b000 :
					LD_R0 = 1'b1;
				3'b001 :
					LD_R1 = 1'b1;
				3'b010 :
					LD_R2 = 1'b1;
				3'b011 :
					LD_R3 = 1'b1;
				3'b100 :
					LD_R4 = 1'b1;
				3'b101 :
					LD_R5 = 1'b1;
				3'b110 :
					LD_R6 = 1'b1;
				3'b111 :
					LD_R7 = 1'b1;
				default : ;
			endcase
		default : ;
	endcase
end

reg_16 reg0(.*, .Load(LD_R0), .Dout(R0));
reg_16 reg1(.*, .Load(LD_R1), .Dout(R1));
reg_16 reg2(.*, .Load(LD_R2), .Dout(R2));
reg_16 reg3(.*, .Load(LD_R3), .Dout(R3));
reg_16 reg4(.*, .Load(LD_R4), .Dout(R4));
reg_16 reg5(.*, .Load(LD_R5), .Dout(R5));
reg_16 reg6(.*, .Load(LD_R6), .Dout(R6));
reg_16 reg7(.*, .Load(LD_R7), .Dout(R7));

endmodule

