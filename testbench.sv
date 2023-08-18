module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic [9:0] SW;
logic	Run, Continue;
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic [15:0] tb_IR, tb_MAR, tb_MDR, tb_PC, tb_bus, tb_hexdata, tb_R0, tb_R1, tb_R2, tb_R3, tb_R4, tb_R5, tb_R6, tb_R7, tb_state;

// To store expected results
logic [7:0] ans_1a, ans_2b;
				
// A counter to count the instances where simulation results
// do no match with expected results
integer ErrorCnt = 0;
		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
slc3_testtop testtop(.*);
assign tb_IR = testtop.slc.IR;
assign tb_MAR = testtop.slc.MAR;
assign tb_MDR = testtop.slc.MDR;
assign tb_PC = testtop.slc.PC;
assign tb_bus = testtop.slc.databus;
assign tb_hexdata = testtop.slc.memory_subsystem.hex_data;
assign tb_R0 = testtop.slc.GPR.R0;
assign tb_R1 = testtop.slc.GPR.R1;
assign tb_R2 = testtop.slc.GPR.R2;
assign tb_R3 = testtop.slc.GPR.R3;
assign tb_R4 = testtop.slc.GPR.R4;
assign tb_R5 = testtop.slc.GPR.R5;
assign tb_R6 = testtop.slc.GPR.R6;
assign tb_R7 = testtop.slc.GPR.R7;
assign tb_state = testtop.slc.state_controller.State;

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
Run = 0;
Continue = 0;

#2 Run = 1;	// Toggle Execute
	Continue = 1;
	
#1 SW = 16'h009C;
	
#5 Run = 0; 
#2 Run = 1;

//#100 SW = 16'h0008;
//#2 Continue = 0;
//
//#100 SW = 16'h0017;

//#100 SW = 16'h0009;
//	 Continue = 0;
//
//#10 Continue = 1;
//
//#100 SW = 16'h0006;
//	  Continue = 0;
//
//#10 Continue = 1;
//
//#100 SW = 16'h0009;
//	 Continue = 0;
//
//#10 Continue = 1;
//
//#100 SW = 16'h0006;
//	  Continue = 0;
//
//#10 Continue = 1;

//#50 SW = 16'h1001;
//
//#5 Continue = 0;
//
//#10 Continue = 1;
//
//#50 SW = 16'h0110;
//
//#5 Continue = 0;
//
//#10 Continue = 1;


//#20 Continue = 0; 
//#2 Continue = 1;
//
//#20 Continue = 0; 
//#2 Continue = 1;
//
//#20 Continue = 0; 
//#2 Continue = 1;
//
//#20 Continue = 0; 
//#2 Continue = 1;
//
//#20 Continue = 0; 
//#2 Continue = 1;
//
//#20 Continue = 0; 
//#2 Continue = 1;
	

   
//#22 Continue = 1;
//	 Run = 1;
//    ans_1a = (8'h33 ^ 8'h55); // Expected result of 1st cycle
    // Aval is expected to be 8’h33 XOR 8’h55
    // Bval is expected to be the original 8’h55
//    if (Aval != ans_1a)
//	 ErrorCnt++;
//    if (Bval != 8'h55)
//	 ErrorCnt++;
//    F = 3'b110;	// Change F and R
//    R = 2'b01;
//
//#2 Execute = 0;	// Toggle Execute
//#2 Execute = 1;
//
//#22 Execute = 0;
//    // Aval is expected to stay the same
//    // Bval is expected to be the answer of 1st cycle XNOR 8’h55
//    if (Aval != ans_1a)	
//	 ErrorCnt++;
//    ans_2b = ~(ans_1a ^ 8'h55); // Expected result of 2nd  cycle
//    if (Bval != ans_2b)
//	 ErrorCnt++;
//    R = 2'b11;
//#2 Execute = 1;
//
//// Aval and Bval are expected to swap
//#22 if (Aval != ans_2b)
//	 ErrorCnt++;
//    if (Bval != ans_1a)
//	 ErrorCnt++;


//if (ErrorCnt == 0)
//	$display("Success!");  // Command line output in ModelSim
//else
//	$display("%d error(s) detected. Try again!", ErrorCnt);
end
endmodule
