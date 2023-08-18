module mux_2_1
#(parameter width = 16)
(
input [width - 1:0] in0, in1,
input logic select,
output logic [width - 1:0] out
);

always_comb
begin
	case(select)
		1'b1 : out = in1;
		default: out = in0;
	endcase
end

endmodule
