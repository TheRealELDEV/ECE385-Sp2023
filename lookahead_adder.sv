module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
logic c4, c8, c12, pg0, pg4, pg8, pg12, gg0, gg4, gg8, gg12;
logic p0, p1, p2, p3, g0, g1, g2, g3;

assign gg0 = (A[3] & B[3]) | ((A[2] & B[2]) & (A[3] ^ B[3])) | ((A[1] & B[1]) & (A[3] ^ B[3]) & (A[2] ^ B[2])) | ((A[0] & B[0]) & (A[3] ^ B[3]) & (A[2] ^ B[2]) & (A[1] ^ B[1]));
assign gg4 = (A[7] & B[7]) | ((A[6] & B[6]) & (A[7] ^ B[7])) | ((A[5] & B[5]) & (A[7] ^ B[7]) & (A[6] ^ B[6])) | ((A[4] & B[4]) & (A[7] ^ B[7]) & (A[6] ^ B[6]) & (A[5] ^ B[5]));
assign gg8 = (A[11] & B[11]) | ((A[10] & B[10]) & (A[11] ^ B[11])) | ((A[9] & B[9]) & (A[11] ^ B[11]) & (A[10] ^ B[10])) | ((A[8] & B[8]) & (A[11] ^ B[11]) & (A[10] ^ B[10]) & (A[9] ^ B[9]));
assign gg12 = (A[15] & B[15]) | ((A[14] & B[14]) & (A[15] ^ B[15])) | ((A[13] & B[13]) & (A[15] ^ B[15]) & (A[14] ^ B[14])) | ((A[12] & B[12]) & (A[15] ^ B[15]) & (A[14] ^ B[14]) & (A[13] ^ B[13]));

assign pg0 = (A[0] ^ B[0]) & (A[1] ^ B[1]) & (A[2] ^ B[2]) & (A[3] ^ B[3]);
assign pg4 = (A[4] ^ B[4]) & (A[5] ^ B[5]) & (A[6] ^ B[6]) & (A[7] ^ B[7]);
assign pg8 = (A[8] ^ B[8]) & (A[9] ^ B[9]) & (A[10] ^ B[10]) & (A[11] ^ B[11]);
assign pg12 = (A[12] ^ B[12]) & (A[13] ^ B[13]) & (A[14] ^ B[14]) & (A[15] ^ B[15]);

assign c4 = gg0 | (cin & pg0);
assign c8 = gg4 | (gg0 & pg4) | (cin & pg0 & pg4);
assign c12 = gg8 | (gg4 & pg8) | (gg0 & pg8 & pg4) | (cin & pg8 & pg4 & pg0);
assign cout = gg12 | (pg12 & gg8) | (pg12 & gg4 & pg8) | (pg12 & gg0 & pg8 & pg4) | (pg12 & cin & pg8 & pg4 & pg0);

four_bit_cla f0(.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]));
four_bit_cla f1(.A(A[7:4]), .B(B[7:4]), .cin(c4), .S(S[7:4]));
four_bit_cla f2(.A(A[11:8]), .B(B[11:8]), .cin(c8), .S(S[11:8]));
four_bit_cla f3(.A(A[15:12]), .B(B[15:12]), .cin(c12), .S(S[15:12]));

endmodule

module four_bit_cla
(
input [3:0] A, B,
input cin,
output logic [3:0] S
);

logic c1, c2, c3, p0, p1, p2, p3, g0, g1, g2, g3;
assign g0 = A[0] & B[0];
assign g1 = A[1] & B[1];
assign g2 = A[2] & B[2];
assign g3 = A[3] & B[3];

assign p0 = A[0] ^ B[0];
assign p1 = A[1] ^ B[1];
assign p2 = A[2] ^ B[2];
assign p3 = A[3] ^ B[3];


assign c1 = (cin & p0) | g0;
assign c2 = (cin & p0 & p1) | (g0 & p1) | g1;
assign c3 = (cin & p0 & p1 & p2) | (g0 & p1 & p2) | (g1 & p2) | g2;

full_adder_cla fa0(.x(A[0]), .y(B[0]), .cin(cin), .s(S[0]));
full_adder_cla fa1(.x(A[1]), .y(B[1]), .cin(c1), .s(S[1]));
full_adder_cla fa2(.x(A[2]), .y(B[2]), .cin(c2), .s(S[2]));
full_adder_cla fa3(.x(A[3]), .y(B[3]), .cin(c3), .s(S[3]));

endmodule

module full_adder_cla
(
input x,
input y,
input cin,
output logic s
);

assign s = x ^ y ^ cin;

endmodule