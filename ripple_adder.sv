module ripple_adder
(
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);


    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */

logic c3, c7, c11;
four_bit_adder f0(.X(A[3:0]), .Y(B[3:0]), .cin(cin), .S(S[3:0]), .cout(c3));
four_bit_adder f1(.X(A[7:4]), .Y(B[7:4]), .cin(c3), .S(S[7:4]), .cout(c7));
four_bit_adder f2(.X(A[11:8]), .Y(B[11:8]), .cin(c7), .S(S[11:8]), .cout(c11));
four_bit_adder f3(.X(A[15:12]), .Y(B[15:12]), .cin(c11), .S(S[15:12]), .cout(cout));

     
endmodule

module four_bit_adder
(
input [3:0] X, Y,
input cin,
output logic [3:0] S,
output logic cout
);

logic c0, c1, c2;
full_adder bit0(.x(X[0]), .y(Y[0]), .cin(cin), .s(S[0]), .cout(c0));
full_adder bit1(.x(X[1]), .y(Y[1]), .cin(c0), .s(S[1]), .cout(c1));
full_adder bit2(.x(X[2]), .y(Y[2]), .cin(c1), .s(S[2]), .cout(c2));
full_adder bit3(.x(X[3]), .y(Y[3]), .cin(c2), .s(S[3]), .cout(cout));


endmodule  

module full_adder
(
input x,
input y,
input cin,
output logic s,
output logic cout
);

assign s = x ^ y ^ cin;
assign cout = (x & y) | (x & cin) | (y & cin);

endmodule

