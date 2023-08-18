module newbackground_out_rom (
	input logic clock,
	input logic [17:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:210239] /* synthesis ram_init_file = "./newbackground_out/newbackground_out.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
