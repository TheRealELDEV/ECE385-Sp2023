module ALU
(
input logic [15:0] A, B,
input logic [1:0] ALUK,
output logic [15:0] Out
);

always_comb
begin
	case(ALUK)
		2'b00: 
			Out = A + B;
		2'b01:
			Out = A & B;
		2'b10:
			Out = ~A;
		2'b11:
			Out = A;
	endcase
end

endmodule

