//Two-always example for state machine

module control (input  logic Clk, Reset, Reset_Load_Clear, LoadB, Run, Mbit,
                output logic Shift, Ld_A, Ld_B, Add, Sub, Clr_Ld);

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    enum logic [4:0] {A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S}   curr_state, next_state, stateval; 

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= A;
		  else if(Reset_Load_Clear)
				curr_state <= S;
//		  else if(M)
//		  begin
//				if(curr_state == H)
//					curr_state <= L;
//				else
//					curr_state <= K;
//		  end
        else 
            curr_state <= next_state;
    end
	 
    // Assign outputs based on state
	always_comb
    begin
        
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        stateval = A;
		  Clr_Ld = 1'b0;
		  unique case (curr_state) 

            A :   begin
							stateval = B;
							if (Run)
							begin
//								if(M)
//									next_state = K;
//								else
									next_state = B;
							end
						end
				S: 	next_state = A;
            B :   begin
							stateval = C;
//							Add = Mbit;
//							Shift = ~Add;
//							Ld_A = 1'b1;
//							if (M)
//								next_state = K;
//							else
								next_state = C;
						end
            C :   begin
							stateval = D; 
//							if (M)
//								next_state = K;
//							else
								next_state = D;
						end
            D :   begin
							stateval = E;
//							Add = Mbit;
//							Shift = ~Add;
//							Ld_A = 1'b1;
//							if (M)
//								next_state = K;
//							else
								next_state = E;
						end
            E :   begin
							stateval = F; 
//							if (M)
//								next_state = K;
//							else
								next_state = F;
						end
				F : 	begin
							stateval = G; 
//							Add = Mbit;
//							Shift = ~Add;
//							Ld_A = 1'b1;
//							if (M)
//								next_state = K;
//							else
								next_state = G; 
						end
            G :   begin
							stateval = H; 
//							if (M)
//								next_state = K;
//							else
								next_state = H;
						end
            H :   begin
							stateval = I;
//							Add = Mbit;
//							Shift = ~Add;
//							Ld_A = 1'b1;
//							if (M)
//								next_state = L;
//							else
								next_state = I;
						end
            I :   next_state = J;
				J : 	begin
							next_state = K;
//							Add = Mbit;
//							Shift = ~Add;
//							Ld_A = 1'b1;
						end
				K : 	next_state = L;
				L : 	begin
							next_state = M;
//							Add = Mbit;
//							Shift = ~Add;
//							Ld_A = 1'b1;
						end
				M : 	next_state = N;
				N : 	begin
							next_state = O;
//							Add = Mbit;
//							Shift = ~Add;
//							Ld_A = 1'b1;
						end
				O : 	next_state = P;
				P : 	begin
							next_state = Q;
//							Add = Mbit;
//							Shift = ~Add;
//							Ld_A = 1'b1;
						end
				Q : 	next_state = R;
            R :   begin
							if (~Run) 
								  next_state = A;
						end
//				K :  	next_state = stateval;
//				L : 	next_state = stateval;
							
							  
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   A: 
	         begin
                Ld_A = 1'b0;
                Ld_B = LoadB;
                Shift = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
					 Clr_Ld = Run;
		      end
				S:
				begin
					Ld_A = 1'b0;
					Ld_B = 1'b1;
					Shift = 1'b0;
					Add = 1'b0;
					Sub = 1'b0;
					Clr_Ld = 1'b1;
				end
	   	   R: 
		      begin
                Ld_A = 1'b0;
                Ld_B = 1'b0;
                Shift = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
		      end
				P:
				begin
					Ld_A = Mbit;
					Ld_B = 1'b0;
					Shift = 1'b0;
					Sub = Mbit;
					Add = ~Sub;
				end
//				K:
//				begin
//					Ld_A = 1'b1;
//					Ld_B = 1'b0;
//					Shift = 1'b0;
//					Add = 1'b1;
//					Sub = 1'b0;
//				end
//				L:
//				begin
//					Ld_A = 1'b1;
//					Ld_B = 1'b0;
//					Shift = 1'b0;
//					Add = 1'b0;
//					Sub = 1'b1;
//				end
				B,D,F,H,J,L,N:
				begin
					Ld_A = Mbit;
					Ld_B = 1'b0;
					Shift = 1'b0;
					Add = Mbit;
					Sub = 1'b0;
				end
	   	   default:  //default case, can also have default assignments for Ld_A and Ld_B before case
		      begin 
                Ld_A = 1'b0;
                Ld_B = 1'b0;
                Shift = 1'b1;
					 Add = 1'b0;
					 Sub = 1'b0;	 
		      end
        endcase
    end

endmodule
