module nine_bit_adder
(
input logic Add, Sub,
input [7:0] S,
input [7:0] A,
output logic X,
output logic [7:0] R
);
	
	logic zero, discard, c0, c1, c2, c3, c4, c5, c6, c7;
	assign zero = 1'b0;

	logic [8:0] A_extend, S_extend;
	logic [7:0] Rcomp;
	logic Xcomp;
	assign A_extend = {A[7], A[7:0]};
	assign S_extend = {S[7], S[7:0]};

	one_bit_adder res0(.a(A_extend[0]), .b(S_extend[0]), .cin(zero), .cout(c0), .s(Rcomp[0]));
	one_bit_adder res1(.a(A_extend[1]), .b(S_extend[1]), .cin(c0), .cout(c1), .s(Rcomp[1]));
	one_bit_adder res2(.a(A_extend[2]), .b(S_extend[2]), .cin(c1), .cout(c2), .s(Rcomp[2]));
	one_bit_adder res3(.a(A_extend[3]), .b(S_extend[3]), .cin(c2), .cout(c3), .s(Rcomp[3]));
	one_bit_adder res4(.a(A_extend[4]), .b(S_extend[4]), .cin(c3), .cout(c4), .s(Rcomp[4]));
	one_bit_adder res5(.a(A_extend[5]), .b(S_extend[5]), .cin(c4), .cout(c5), .s(Rcomp[5]));
	one_bit_adder res6(.a(A_extend[6]), .b(S_extend[6]), .cin(c5), .cout(c6), .s(Rcomp[6]));
	one_bit_adder res7(.a(A_extend[7]), .b(S_extend[7]), .cin(c6), .cout(c7), .s(Rcomp[7]));
	one_bit_adder res8(.a(A_extend[8]), .b(S_extend[8]), .cin(c7), .cout(discard), .s(Xcomp));
	
	logic [7:0] notS;
	assign notS[0] = ~S[0];
	assign notS[1] = ~S[1];
	assign notS[2] = ~S[2];
	assign notS[3] = ~S[3];
	assign notS[4] = ~S[4];
	assign notS[5] = ~S[5];
	assign notS[6] = ~S[6];
	assign notS[7] = ~S[7];

	logic [7:0] one;
	assign one = 8'h01;
	
	logic discard2, discard3, discard4;
	logic c00, c11, c22, c33, c44, c55, c66, c77;
	logic c000, c111, c222, c333, c444, c555, c666, c777;

	logic [7:0] Stwos;
	logic [8:0] Stwos_extend;

	logic [7:0] Rcomp2;
	logic Xcomp2;
	
	one_bit_adder res00(.a(notS[0]), .b(one[0]), .cin(zero), .cout(c00), .s(Stwos[0]));
	one_bit_adder res11(.a(notS[1]), .b(one[1]), .cin(c00), .cout(c11), .s(Stwos[1]));
	one_bit_adder res22(.a(notS[2]), .b(one[2]), .cin(c11), .cout(c22), .s(Stwos[2]));
	one_bit_adder res33(.a(notS[3]), .b(one[3]), .cin(c22), .cout(c33), .s(Stwos[3]));
	one_bit_adder res44(.a(notS[4]), .b(one[4]), .cin(c33), .cout(c44), .s(Stwos[4]));
	one_bit_adder res55(.a(notS[5]), .b(one[5]), .cin(c44), .cout(c55), .s(Stwos[5]));
	one_bit_adder res66(.a(notS[6]), .b(one[6]), .cin(c55), .cout(c66), .s(Stwos[6]));
	one_bit_adder res77(.a(notS[7]), .b(one[7]), .cin(c66), .cout(c77), .s(Stwos[7]));
	
	assign Stwos_extend = {Stwos[7], Stwos[7:0]};
	
	one_bit_adder res000(.a(A_extend[0]), .b(Stwos_extend[0]), .cin(zero), .cout(c000), .s(Rcomp2[0]));
	one_bit_adder res111(.a(A_extend[1]), .b(Stwos_extend[1]), .cin(c000), .cout(c111), .s(Rcomp2[1]));
	one_bit_adder res222(.a(A_extend[2]), .b(Stwos_extend[2]), .cin(c111), .cout(c222), .s(Rcomp2[2]));
	one_bit_adder res333(.a(A_extend[3]), .b(Stwos_extend[3]), .cin(c222), .cout(c333), .s(Rcomp2[3]));
	one_bit_adder res444(.a(A_extend[4]), .b(Stwos_extend[4]), .cin(c333), .cout(c444), .s(Rcomp2[4]));
	one_bit_adder res555(.a(A_extend[5]), .b(Stwos_extend[5]), .cin(c444), .cout(c555), .s(Rcomp2[5]));
	one_bit_adder res666(.a(A_extend[6]), .b(Stwos_extend[6]), .cin(c555), .cout(c666), .s(Rcomp2[6]));
	one_bit_adder res777(.a(A_extend[7]), .b(Stwos_extend[7]), .cin(c666), .cout(c777), .s(Rcomp2[7]));
	one_bit_adder res888(.a(A_extend[8]), .b(Stwos_extend[8]), .cin(c777), .cout(discard4), .s(Xcomp2));
	
always_comb
begin
if(Add)
	begin
		R = Rcomp;
		X = Xcomp;
	end
else if(Sub)
	begin
		R = Rcomp2;
		X = Xcomp2;
	end
else
	begin
		R = A;
		X = A[7];
	end
end

endmodule 

//module nine_bit_subtractor
//(
//input logic Sub,
//input [7:0] S,
//input [7:0] A,
//output logic X,
//output logic [7:0] R
//);
//
//logic [7:0] notS;
//assign notS[0] = ~S[0];
//assign notS[1] = ~S[1];
//assign notS[2] = ~S[2];
//assign notS[3] = ~S[3];
//assign notS[4] = ~S[4];
//assign notS[5] = ~S[5];
//assign notS[6] = ~S[6];
//assign notS[7] = ~S[7];
//
//logic [7:0] one;
//assign one = 8'h01;
//
//logic [7:0] Stwos;
//
//logic [7:0] Rcomp2;
//logic Xcomp2;
//
//nine_bit_adder a1(.Add(Add), .S(notS), .A(one), .X(discard), .R(Stwos));
//nine_bit_adder fin(.Add(Add), .S(Stwos), .A(A), .X(Xcomp), .R(Rcomp));
//
//always_comb
//begin
//	if(Sub)
//	begin 
//		R = Rcomp;
//		X = Xcomp;
//	end
//	else
//	begin
//		R = A;
//		X = A[7];
//	end
//end
//
//endmodule



module one_bit_adder
(
input a,
input b,
input cin,
output logic cout,
output logic s
);

assign s = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);

endmodule


