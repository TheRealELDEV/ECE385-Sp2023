//4-bit logic processor top level module
//for use with ECE 385 Spring 2021
//last modified by Zuofu Cheng


//Always use input/output logic types when possible, prevents issues with tools that have strict type enforcement

module Processor (input logic   Clk,     // Internal
                                Reset,
										  Reset_Load_Clear,// Push button 0
                                LoadB,   // Push button 2
                                Run, // Push button 3
                  input  logic [7:0]  Din,     // input data
				  //Hint for SignalTap, you want to comment out the following 2 lines to hardwire values for F and R
                  output logic [3:0]  LED,     // DEBUG
                  output logic [7:0]  Aval,    // DEBUG
                                Bval,    // DEBUG
                  output logic [6:0]  AhexL,
                                AhexU,
                                BhexL,
                                BhexU,
						output logic Xval );

	 //local logic variables go here
	 logic Reset_SH, LoadB_SH, Run_SH, Reset_Load_Clear_SH;
	 logic Ld_A, Ld_B, Shift_En, M, Add, Sub;
	 logic [7:0] A, B, Din_S, Result;
	 logic X, X_Result, Ashift, Bshift, discard, Clr_Ld;
	 
	 
	 //We can use the "assign" statement to do simple combinational logic
	 assign Aval = A;
	 assign Bval = B;
	 assign Xval = X;
	 assign LED = {Run_SH, LoadB_SH, Add, Sub}; //Concatenate is a common operation in HDL
	 
	 
	 //assign Ld_A = 1'b0;
	 //assign Shift_En = 1'b1;
	 //assign Result = 8'h00;
	 //assign X_Result = 1'b0;
	 //assign A = 8'h0A;
	 //assign X = 1'b0;
	 
	 
	 //Instantiation of modules here
	 register_unit    reg_unit (
                        .Clk(Clk), // inputs
                        .Reset(Reset_SH),
								.Clr_Ld(Clr_Ld),
                        .Load_A(Ld_A), 
                        .Load_B(Ld_B),
								.Load_X(Ld_A),
                        .Shift(Shift_En),
                        .A_Din(Result),
								.B_Din(Din_S),
								.Xin(X_Result),
								.Xshift(X),
								.A_In(Ashift),
								.B_In(Bshift),
								.Xout(Ashift), // outputs
								.A_out(Bshift),
								.B_out(discard),
                        .A(A), 
                        .B(B),
								.X(X) );
	assign M = B[0];
//	assign Add = 1'b0;
//	assign Sub = 1'b1;
//	assign A = 8'h08;
//								
	nine_bit_adder  compute_unit (
								.Add,
								.Sub,
                        .S(Din_S),
                        .A(A),
								.X(X_Result), //outputs
								.R(Result) );

	 control          control_unit (
                        .Clk(Clk), // inputs
                        .Reset(Reset_SH),
								.Reset_Load_Clear(Reset_Load_Clear_SH),
                        .LoadB(LoadB_SH),
                        .Run(Run_SH),
								.Mbit(M),
                        .Shift(Shift_En), //outputs
                        .Ld_A,
                        .Ld_B,
								.Clr_Ld(Clr_Ld),
								.Add, 
								.Sub);
	 HexDriver        HexAL (
                        .In0(A[3:0]),
                        .Out0(AhexL) );
	 HexDriver        HexBL (
                        .In0(B[3:0]),
                        .Out0(BhexL) );
								
	 //When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0
	 HexDriver        HexAU (
                        .In0(A[7:4]),
                        .Out0(AhexU) );	
	 HexDriver        HexBU (
                       .In0(B[7:4]),
                        .Out0(BhexU) );
								
	  //Input synchronizers required for asynchronous inputs (in this case, from the switches)
	  //These are array module instantiations
	  //Note: S stands for SYNCHRONIZED, H stands for active HIGH
	  //Note: We can invert the levels inside the port assignments
	  sync button_sync[3:0] (Clk, {~Reset, Reset_Load_Clear, LoadB, ~Run}, {Reset_SH, Reset_Load_Clear_SH, LoadB_SH, Run_SH});
	  sync Din_sync[7:0] (Clk, Din, Din_S);
	  
endmodule
