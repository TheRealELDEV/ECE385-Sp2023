module Control (input logic Clk, Reset, 
					 input logic [7:0] keycode,
                output logic menu_on, end_on, fail_on,
					 output logic [2:0] song_select );

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    enum logic [3:0] {Menu, TTLS, HCB, OTJ, VLV, MHALL, Fail, Success}   curr_state, next_state; 

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= Menu;
        else 
            curr_state <= next_state;
    end

    // Assign outputs based on state
	always_comb
    begin
        song_select = 3'd0;
		  menu_on = 1'b0;
		  end_on = 1'b0;
		  fail_on = 1'b0;
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            Menu : 
				begin
//					unique case (keycode)
//						8'd30: next_state = HCB;
//						8'd31: next_state = MHALL;
//						8'd32: next_state = TTLS;
//						8'd33: next_state = OTJ;
//						8'd34: next_state = VLV;
//					endcase
						 if (keycode == 8'd30)
                       next_state = HCB;
						 else if (keycode == 8'd31)
							  next_state = MHALL;
						 else if (keycode == 8'd32)
						     next_state = TTLS;
						 else if (keycode == 8'd33)
							  next_state = OTJ;
						 else if (keycode == 8'd34)
							  next_state = VLV;
				end
            TTLS :    
				begin
//					unique case (keycode)
//						8'd44: next_state = Fail;
//						8'd40: next_state = Success;
//					endcase
						if(keycode == 8'd44)
							next_state = Fail;
						if(keycode == 8'd40)
							next_state = Success;
				end
            HCB :    
				begin
//					unique case (keycode)
//						8'd44: next_state = Fail;
//						8'd40: next_state = Success;
//					endcase
						if(keycode == 8'd44)
							next_state = Fail;
						if(keycode == 8'd40)
							next_state = Success;
				end
            OTJ :    
				begin
//					unique case (keycode)
//						8'd44: next_state = Fail;
//						8'd40: next_state = Success;
//					endcase
						if(keycode == 8'd44)
							next_state = Fail;
						if(keycode == 8'd40)
							next_state = Success;
				end
            VLV :    
				begin
//					unique case (keycode)
//						8'd44: next_state = Fail;
//						8'd40: next_state = Success;
//					endcase
						if(keycode == 8'd44)
							next_state = Fail;
						if(keycode == 8'd40)
							next_state = Success;
				end
				MHALL : 	 
				begin
//					unique case (keycode)
//						8'd44: next_state = Fail;
//						8'd40: next_state = Success;
//					endcase
						if(keycode == 8'd44)
							next_state = Fail;
						if(keycode == 8'd40)
							next_state = Success;
				end 
            Fail :    
				begin
						if(keycode == 8'd42)
							next_state = Menu;
				end
            Success :
				begin
						if(keycode == 8'd42)
							next_state = Menu;
				end
//            I :    next_state = J;
//            J :    if (~Execute) 
//                       next_state = A;
							  
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   Menu: 
	         begin
                menu_on = 1'b1;
		      end
				HCB:
				begin
					song_select = 3'b001;
				end
				MHALL:
				begin
					song_select = 3'b010;
				end
				TTLS:
				begin
					song_select = 3'b011;
				end
				OTJ:
				begin
					song_select = 3'b100;
				end
				VLV:
				begin
					song_select = 3'b101;
				end
	   	   Fail: 
		      begin
					fail_on = 1'b1;
		      end
				Success:
				begin
					end_on = 1'b1;
				end
	   	   default:  //default case, can also have default assignments for Ld_A and Ld_B before case
				begin
					song_select = 3'b000;
					menu_on = 1'b0;
					end_on = 1'b0;
					fail_on = 1'b0;
				end
        endcase
    end

endmodule

