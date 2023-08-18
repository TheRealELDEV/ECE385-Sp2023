//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball ( input Reset, frame_clk,
					input [7:0] keycode,
					input [8:0] x_displacement, 
					input [8:0] y_displacement, 
					input [2:0]  mouse_button,
               output [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	 logic [7:0] x_d, y_d;
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    assign Ball_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
        end
           
        else 
        begin
					Ball_X_Motion <= x_displacement/65;//(x_displacement >= 4 || x_displacement <= -4) ? x_displacement : x_displacement/4;
					Ball_Y_Motion <= x_displacement/65;//(y_displacement >= 4 || y_displacement <= -4) ? y_displacement : y_displacement/4;
//				 if (y_displacement<0)
//					  y_d <= (~ (y_displacement) + 1'b1);
//				 else 
//					  y_d <= y_displacement;
//				 if (x_displacement[7])
//					  x_d <= (~ (x_displacement) + 1'b1);
//				 else 
//					  x_d <= x_displacement;
				 if ($signed(Ball_Y_Pos) + $signed(Ball_Size) >= $signed(Ball_Y_Max))  // Ball is at the bottom edge, BOUNCE!
				 begin
					  Ball_Y_Motion <= ~Ball_Y_Step + 10'd1; //(~ (Ball_Y_Step) + 1'b1);  // 2's complement.
					  //Ball_X_Motion <= 0; //x_displacement; //x_displacement[6:0] - 2 * x_displacement[7] * {3'd0, x_displacement[6:0]};
				 end
				 else if ($signed(Ball_Y_Pos) - $signed(Ball_Size) <= $signed(Ball_Y_Min))  // Ball is at the top edge, BOUNCE!
				 begin
					  Ball_Y_Motion <= Ball_Y_Step;
					  //Ball_X_Motion <= 0; //x_displacement; //x_displacement[6:0] - 2 * x_displacement[7] * {3'd0, x_displacement[6:0]};
				 end
				 else if ($signed(Ball_X_Pos) + $signed(Ball_Size) >= $signed(Ball_X_Max))  // Ball is at the Right edge, BOUNCE!
				 begin
					  Ball_X_Motion <= ~Ball_X_Step + 10'd1; //(~ (Ball_X_Step) + 1'b1);  // 2's complement.
					  //Ball_Y_Motion <= 0; //y_displacement; //y_displacement[6:0] - 2 * y_displacement[7] * {3'd0, y_displacement[6:0]};
				 end
				 else if ($signed(Ball_X_Pos) - $signed(Ball_Size) <= $signed(Ball_X_Min))  // Ball is at the Left edge, BOUNCE!
				 begin
					  Ball_X_Motion <= Ball_X_Step;
					  //Ball_Y_Motion <= 0; //y_displacement; //y_displacement[6:0] - 2 * y_displacement[7] * {3'd0, y_displacement[6:0]};
				 end
//				 else begin
					
//					if (x_displacement < -2)
//					  Ball_X_Motion <= 1;
//					  
//					 if (y_displacement < -2)
//						Ball_Y_Motion <= 1;
//						
//					 if (x_displacement > 2)
//					  Ball_X_Motion <= -1;
//					  
//					 if (y_displacement > 2)
//						Ball_Y_Motion <= -1;
//				 end
				 /*
				 else if (y_displacement[7] && x_displacement[7])
				 begin
					  Ball_Y_Motion <= -1 * (~{2'd3, y_displacement} + 10'd1);
					  Ball_X_Motion <= -1 * (~{2'd3, x_displacement} + 10'd1);
				 end
				 else if (~y_displacement[7] && x_displacement[7])
				 begin
					  Ball_Y_Motion <= y_displacement;
					  Ball_X_Motion <= ~{2'd3, x_displacement} + 10'd1;
				 end
				 else if (y_displacement[7] && ~x_displacement[7])
				 begin
					  Ball_X_Motion <= -1* x_displacement;
					  Ball_Y_Motion <= -1 * (~{2'd3, y_displacement} + 10'd1);
				 end
				 else
				 begin
					  Ball_Y_Motion <= y_displacement;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  Ball_X_Motion <= x_displacement;
				*/
				 
				 /*
					 case (keycode)
						8'h04 : begin

									Ball_X_Motion <= -1;//A
									Ball_Y_Motion<= 0;
								  end
								  
						8'h07 : begin
									
								  Ball_X_Motion <= 1;//D
								  Ball_Y_Motion <= 0;
								  end

								  
						8'h16 : begin

								  Ball_Y_Motion <= 1;//S
								  Ball_X_Motion <= 0;
								 end
								  
						8'h1A : begin
								  Ball_Y_Motion <= -1;//W
								  Ball_X_Motion <= 0;
								 end	  
						default: ;
					endcase
				*/
				//end
				 
				 Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				 Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
			
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
          Note that Ball_Y_Motion in the above statement may have been changed at the same clock edge
          that is causing the assignment of Ball_Y_pos.  Will the new value of Ball_Y_Motion be used,
          or the old?  How will this impact behavior of the ball during a bounce, and how might that 
          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
      **************************************************************************************/
      
			
		end  
    end
       
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule
