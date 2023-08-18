module ROM_A4
(
		input [31:0] data_In,
		input [14:0] write_address,
		input [6:0] read_address,
		input we, Clk,
		output logic [6:0] len,
		output logic [31:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
logic [31:0] mem [0:23];
//logic [31:0] mem [0:76];

initial
begin
	 $readmemh("2 A4.txt", mem);
	 //$readmemh("19 A4.txt", mem);
end

assign len = 7'd24;
//assign len = 7'd77;

always_ff @ (posedge Clk) begin
	if (we)
		mem[write_address] <= data_In;
	data_Out <= $signed({mem[read_address], 20'd0});
end

endmodule

