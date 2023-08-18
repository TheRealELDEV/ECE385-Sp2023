module fetch_reg_unit
(
input Clk, Reset, LD_PC, LD_MAR, LD_MDR, LD_IR,
input logic [15:0] PCIn, MARIn, MDRIn, IRIn,
output logic [15:0] PCOut, MAROut, MDROut, IROut
);

	reg_16 PC(.*, .Din(PCIn), .Dout(PCOut), .Load(LD_PC));
	reg_16 MAR(.*, .Din(MARIn), .Dout(MAROut), .Load(LD_MAR));
	reg_16 MDR(.*, .Din(MDRIn), .Dout(MDROut), .Load(LD_MDR));
	reg_16 IR(.*, .Din(IRIn), .Dout(IROut), .Load(LD_IR));

endmodule

