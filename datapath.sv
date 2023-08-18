module datapath 
(
//input logic Clk, Reset, LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
input logic GatePC, GateMDR, GateALU, GateMARMUX,
//input logic SR2MUX, ADDR1MUX, MARMUX,
//input logic BEN, MIO_EN, DRMUX, SR1MUX,
//input logic [1:0] PCMUX, ADDR2MUX, ALUK,
//input logic [15:0] MDR_In,
input logic [15:0] MAR, MDR, IR, PC, ALUOut, ADDRAdd,
output logic [15:0] databus
);

logic [15:0] oldBus;
assign oldBus = databus;
logic [3:0] concat; 
assign concat = {GatePC, GateALU, GateMARMUX, GateMDR}; 
always_comb
begin
	case(concat)
	4'b1000: databus = PC; 
	4'b0100: databus = ALUOut; 
	4'b0010: databus = ADDRAdd; 
	4'b0001: databus = MDR; 
	default: databus = 16'bx;
	endcase
end

endmodule

