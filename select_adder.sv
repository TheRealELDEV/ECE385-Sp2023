module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	  logic c1, c2, c0;

	  four_bit_adder_sa fba0(.X(A[3:0]), .Y(B[3:0]), .cin(cin), .S(S[3:0]), .cout(c0));
	  four_bit_adder_sa fba1(.X(A[7:4]), .Y(B[7:4]), .cin(c0), .S(S[7:4]), .cout(c1));
	  four_bit_adder_sa fba2(.X(A[11:8]), .Y(B[11:8]), .cin(c1), .S(S[11:8]), .cout(c2));
	  four_bit_adder_sa fba3(.X(A[15:12]), .Y(B[15:12]), .cin(c2), .S(S[15:12]), .cout(cout));	  

endmodule


module four_bit_adder_sa
(
input [3:0] X, Y,
input cin,
output logic [3:0] S,
output logic cout
);

logic c0, c1, c2, c3, c4, c5, cin0, cin1, cout0, cout1;
logic [3:0] S0;
logic [3:0] S1;

	  always_comb 
	  begin
	  cin0 = 1'b0;
	  cin1 = 1'b1;
	  end


full_adder_sa bit0(.x(X[0]), .y(Y[0]), .cin(cin0), .s(S0[0]), .cout(c0));
full_adder_sa bit1(.x(X[1]), .y(Y[1]), .cin(c0), .s(S0[1]), .cout(c1));
full_adder_sa bit2(.x(X[2]), .y(Y[2]), .cin(c1), .s(S0[2]), .cout(c2));
full_adder_sa bit3(.x(X[3]), .y(Y[3]), .cin(c2), .s(S0[3]), .cout(cout0));

full_adder_sa bit4(.x(X[0]), .y(Y[0]), .cin(cin1), .s(S1[0]), .cout(c3));
full_adder_sa bit5(.x(X[1]), .y(Y[1]), .cin(c3), .s(S1[1]), .cout(c4));
full_adder_sa bit6(.x(X[2]), .y(Y[2]), .cin(c4), .s(S1[2]), .cout(c5));
full_adder_sa bit7(.x(X[3]), .y(Y[3]), .cin(c5), .s(S1[3]), .cout(cout1));

	  mux_2_1_4bit S30(.in0(S0), .in1(S1), .select(cin), .out(S));
	  mux_2_1_1bit co(.in0(cout0), .in1(cout1), .select(cin), .out(cout));

endmodule  

module full_adder_sa
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

module mux_2_1_4bit (
input [3:0] in0,
input [3:0] in1,
input select,
output [3:0] out
);

always_comb
	begin
		unique case(select)
			1'b0: out <= in0;
			1'b1: out <= in1;
		endcase
	end

endmodule

module mux_2_1_1bit (
input in0,
input in1,
input select,
output out
);

always_comb
	begin
		unique case(select)
			1'b0: out <= in0;
			1'b1: out <= in1;
		endcase
	end

endmodule
