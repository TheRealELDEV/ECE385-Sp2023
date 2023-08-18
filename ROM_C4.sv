module ROM_C4
(
		input [31:0] data_In,
		input [14:0] write_address,
		input [6:0] read_address,
		input we, Clk,
		output logic [6:0] len,
		output logic [31:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [31:0] mem [0:40];
//logic [31:0] mem [0:24];

initial
begin
	 $readmemh("3 C4.txt", mem);
end

assign len = 7'd41;
//assign len = 7'd25;

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out <= $signed({mem[read_address], 20'd0});
end

endmodule

