module audioROM
(
		input [31:0] data_In,
		input [14:0] write_address,
		input [6:0] read_address,
		input we, Clk,
		input [7:0] keycode,
		output logic [6:0] len,
		output logic [31:0] data_Out
);

logic [31:0] A4_Out, B4_Out, C4_Out, D4_Out, E4_Out, F4_Out, G4_Out, FS4_Out, CS4_Out, GS4_Out;
logic [6:0] lenA4, lenB4, lenC4, lenD4, lenE4, lenF4, lenG4, lenFS4, lenCS4, lenGS4;

ROM_A4 A4(.*, .len(lenA4), .data_Out(A4_Out));
ROM_B4 B4(.*, .len(lenB4), .data_Out(B4_Out));
ROM_C4 C4(.*, .len(lenC4), .data_Out(C4_Out));
ROM_D4 D4(.*, .len(lenD4), .data_Out(D4_Out));
ROM_E4 E4(.*, .len(lenE4), .data_Out(E4_Out));
ROM_F4 F4(.*, .len(lenF4), .data_Out(F4_Out));
ROM_G4 G4(.*, .len(lenG4), .data_Out(G4_Out));
ROM_FS4 FS4(.*, .len(lenFS4), .data_Out(FS4_Out));
ROM_CS4 CS4(.*, .len(lenCS4), .data_Out(CS4_Out));
ROM_GS4 GS4(.*, .len(lenGS4), .data_Out(GS4_Out));

//logic [31:0] mem [0:1999];
//
//logic [18:0] ctr, factor;
//logic [14:0] read_address;
//
//initial
//begin
//	$readmemh("A4 (7).txt", mem);
//	factor = 19'd0;
//	data_Out = 32'd0;
//	ctr = 19'd1;
//	read_address = 15'd0;
//end
//
always_comb
begin
	case (keycode)
		8'd4 : 
		begin
			len = lenC4;
			data_Out = C4_Out;
		end
		8'd22 : 
		begin
			len = lenD4;
			data_Out = D4_Out;
		end
		8'd7 : 
		begin
			len = lenE4;
			data_Out = E4_Out;
		end
		8'd9 : 
		begin
			len = lenF4;
			data_Out = F4_Out;
		end
		8'd10 : 
		begin
			len = lenG4;
			data_Out = G4_Out;
		end
		8'd11 : 
		begin
			len = lenA4;
			data_Out = A4_Out;
		end
		8'd13 : 
		begin
			len = lenB4;
			data_Out = B4_Out;
		end
		8'd23 :
		begin
			len = lenFS4;
			data_Out = FS4_Out;
		end
		8'd26 : 
		begin
			len = lenCS4;
			data_Out = CS4_Out;
		end
		8'd28 : 
		begin
			len = lenGS4;
			data_Out = GS4_Out;
		end
		default : 
		begin
			len = 7'd0;
			data_Out = 32'd0;
		end
	endcase
	data_Out = data_Out >> 1;
end
//
//always_ff @ (posedge Clk)
//begin
//	if (we)
//		mem[write_address] <= data_In;
//	if(factor > 19'd0)
//	begin
//		if(ctr == factor)
//		begin
//			ctr <= 19'd1;
//			data_Out <= mem[read_address];
//			if(read_address == 15'd2000)
//			begin
//				read_address <= 15'd0;
//			end
//			else
//			begin
//				read_address <= read_address + 1;
//			end
//		end
//		else
//		begin
//			ctr <= ctr + 1;
//		end
//	end
//	else
//	begin
//		data_Out <= 32'd0;
//		read_address <= 15'd0;
//		ctr <= 19'd0;
//	end
//end

endmodule

