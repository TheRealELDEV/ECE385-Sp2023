//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input vga_clk, frame_clk, Reset, blank, menu_on, end_on, fail_on,
							  input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
							  //input 			[9:0] RectX, RectY, RectWidth, RectHeight,
							  input [4999:0] rectangles,
							  input [6:0] numRectangles,
							  input [7:0] keycode,
                       output logic [7:0]  Red, Green, Blue );
    
    logic ball_on;
	 logic rect_on;
	 
	 parameter [9:0] RectX_C = 10'd0;
	 parameter [9:0] RectX_CS = 10'd54;
	 parameter [9:0] RectX_D = 10'd107;
	 parameter [9:0] RectX_DS = 10'd160;
	 parameter [9:0] RectX_E = 10'd214;
	 parameter [9:0] RectX_F = 10'd267;
	 parameter [9:0] RectX_FS = 10'd320;
	 parameter [9:0] RectX_G = 10'd374;
	 parameter [9:0] RectX_GS = 10'd427;
	 parameter [9:0] RectX_A = 10'd480;
	 parameter [9:0] RectX_AS = 10'd534;
	 parameter [9:0] RectX_B = 10'd587;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	 
	 logic [3:0] BG_R, BG_G, BG_B;
	 logic [3:0] MENU_R, MENU_G, MENU_B;
	 logic [3:0] END_R, END_G, END_B;
	 logic [3:0] FAIL_R, FAIL_G, FAIL_B;
	 
	 newbackground_out_example bg(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(BG_R), .green(BG_G), .blue(BG_B));
	 menu_out_example menu(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(MENU_R), .green(MENU_G), .blue(MENU_B));
	 rectangle r0(.*, .startY(13'd0), .RectY(RectY_0)); // F#
	 rectangle r1(.*, .startY(-13'd40), .RectY(RectY_1)); // E
	 rectangle r2(.*, .startY(-13'd110), .RectY(RectY_2)); // D
	 rectangle r3(.*, .startY(-13'd160), .RectY(RectY_3)); // F#
	 rectangle r4(.*, .startY(-13'd200), .RectY(RectY_4)); // E
	 rectangle r5(.*, .startY(-13'd270), .RectY(RectY_5)); // D
	 rectangle r6(.*, .startY(-13'd305), .RectY(RectY_6)); // D
	 rectangle r7(.*, .startY(-13'd325), .RectY(RectY_7)); // D
	 rectangle r8(.*, .startY(-13'd345), .RectY(RectY_8)); // D
	 rectangle r9(.*, .startY(-13'd365), .RectY(RectY_9)); // D
	 rectangle r10(.*, .startY(-13'd385), .RectY(RectY_10)); // E
	 rectangle r11(.*, .startY(-13'd405), .RectY(RectY_11)); // E
	 rectangle r12(.*, .startY(-13'd425), .RectY(RectY_12)); // E
	 rectangle r13(.*, .startY(-13'd445), .RectY(RectY_13)); // E
	 rectangle r14(.*, .startY(-13'd490), .RectY(RectY_14)); // F#
	 rectangle r15(.*, .startY(-13'd530), .RectY(RectY_15)); // E
	 rectangle r16(.*, .startY(-13'd600), .RectY(RectY_16)); // D
	 
	 rectangle r17(.*, .startY(13'd0), .RectY(RectY_17)); // F#
	 rectangle r18(.*, .startY(-13'd40), .RectY(RectY_18)); // E
	 rectangle r19(.*, .startY(-13'd80), .RectY(RectY_19)); // D
	 rectangle r20(.*, .startY(-13'd120), .RectY(RectY_20)); // E
	 rectangle r21(.*, .startY(-13'd160), .RectY(RectY_21)); // F#
	 rectangle r22(.*, .startY(-13'd200), .RectY(RectY_22)); // F#
	 rectangle r23(.*, .startY(-13'd270), .RectY(RectY_23)); // F#
	 rectangle r24(.*, .startY(-13'd320), .RectY(RectY_24)); // E
	 rectangle r25(.*, .startY(-13'd360), .RectY(RectY_25)); // E
	 rectangle r26(.*, .startY(-13'd430), .RectY(RectY_26)); // E
	 rectangle r27(.*, .startY(-13'd480), .RectY(RectY_27)); // F#
	 rectangle r28(.*, .startY(-13'd520), .RectY(RectY_28)); // A
	 rectangle r29(.*, .startY(-13'd590), .RectY(RectY_29)); // A
	 rectangle r30(.*, .startY(-13'd640), .RectY(RectY_30)); // F#
	 rectangle r31(.*, .startY(-13'd680), .RectY(RectY_31)); // E
	 rectangle r32(.*, .startY(-13'd720), .RectY(RectY_32)); // D
	 rectangle r33(.*, .startY(-13'd760), .RectY(RectY_33)); // E
	 rectangle r34(.*, .startY(-13'd800), .RectY(RectY_34)); // F#
	 rectangle r35(.*, .startY(-13'd840), .RectY(RectY_35)); // F#
	 rectangle r36(.*, .startY(-13'd880), .RectY(RectY_36)); // F#
	 rectangle r37(.*, .startY(-13'd920), .RectY(RectY_37)); // F#
	 rectangle r38(.*, .startY(-13'd960), .RectY(RectY_38)); // E
	 rectangle r39(.*, .startY(-13'd1000), .RectY(RectY_39)); // E
	 rectangle r40(.*, .startY(-13'd1040), .RectY(RectY_40)); // F#
	 rectangle r41(.*, .startY(-13'd1080), .RectY(RectY_41)); // E
	 rectangle r42(.*, .startY(-13'd1180), .RectY(RectY_42)); // D
	 //ending_example ending(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(END_R), .green(END_G), .blue(END_B));
	 //failed_example failed(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(FAIL_R), .green(FAIL_G), .blue(FAIL_B));

    int DistX, DistY, Size, RectDistX, RectDistY;
	 int DistX1, DistX2, DistX3, DistX4, DistX5, DistX6, DistX7, DistX8, DistX9, DistX10, DistX11, DistX12, DistX13, DistX14, DistX15, DistX16, DistX17;
	 int DistY1, DistY2, DistY3, DistY4, DistY5, DistY6, DistY7, DistY8, DistY9, DistY10, DistY11, DistY12, DistY13, DistY14, DistY15, DistY16, DistY17;
	 logic [9:0] RectX, RectWidth, RectHeight;
	 logic [12:0] RectY, RectY1, RectY2, RectY3, RectY4, RectY5, RectY6, RectY7, RectY8, RectY9, RectY10, RectY11, RectY12;
	 logic [12:0] RectY_0, RectY_1, RectY_2, RectY_3, RectY_4, RectY_5, RectY_6;
	 logic [12:0] RectY_7, RectY_8, RectY_9, RectY_10, RectY_11, RectY_12, RectY_13;
	 logic [12:0] RectY_14, RectY_15, RectY_16;
	 logic [12:0] RectY_17, RectY_18, RectY_19, RectY_20, RectY_21, RectY_22, RectY_23;
	 logic [12:0] RectY_24, RectY_25, RectY_26, RectY_27, RectY_28, RectY_29, RectY_30;
	 logic [12:0] RectY_31, RectY_32, RectY_33, RectY_34, RectY_35, RectY_36, RectY_37;
	 logic [12:0] RectY_38, RectY_39, RectY_40, RectY_41, RectY_42;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
	 assign DistX1 = DrawX - RectX_FS;
	 assign DistX2 = DrawX - RectX_E;
	 assign DistX3 = DrawX - RectX_D;
	 assign DistX4 = DrawX - RectX_FS;
	 assign DistX5 = DrawX - RectX_E;
	 assign DistX6 = DrawX - RectX_D;
	 assign DistX7 = DrawX - RectX_D;
	 assign DistX8 = DrawX - RectX_D;
	 assign DistX9 = DrawX - RectX_D;
	 assign DistX10 = DrawX - RectX_D;
	 assign DistX11 = DrawX - RectX_E;
	 assign DistX12 = DrawX - RectX_E;
	 assign DistX13 = DrawX - RectX_E;
	 assign DistX14 = DrawX - RectX_E;
	 assign DistX15 = DrawX - RectX_FS;
	 assign DistX16 = DrawX - RectX_E;
	 assign DistX17 = DrawX - RectX_D;
	 assign DistY1 = DrawY - RectY_0;
	 assign DistY2 = DrawY - RectY_1;
	 assign DistY3 = DrawY - RectY_2;
	 assign DistY4 = DrawY - RectY_3;
	 assign DistY5 = DrawY - RectY_4;
	 assign DistY6 = DrawY - RectY_5;
	 assign DistY7 = DrawY - RectY_6;
	 assign DistY8 = DrawY - RectY_7;
	 assign DistY9 = DrawY - RectY_8;
	 assign DistY10 = DrawY - RectY_9;
	 assign DistY11 = DrawY - RectY_10;
	 assign DistY12 = DrawY - RectY_11;
	 assign DistY13 = DrawY - RectY_12;
	 assign DistY14 = DrawY - RectY_13;
	 assign DistY15 = DrawY - RectY_14;
	 assign DistY16 = DrawY - RectY_15;
	 assign DistY17 = DrawY - RectY_16;
	 
	 assign DistX18 = DrawX - RectX_FS;
	 assign DistX19 = DrawX - RectX_E;
	 assign DistX20 = DrawX - RectX_D;
	 assign DistX21 = DrawX - RectX_E;
	 assign DistX22 = DrawX - RectX_FS;
	 assign DistX23 = DrawX - RectX_FS;
	 assign DistX24 = DrawX - RectX_FS;
	 assign DistX25 = DrawX - RectX_FS;
	 assign DistX26 = DrawX - RectX_E;
	 assign DistX27 = DrawX - RectX_E;
	 assign DistX28 = DrawX - RectX_E;
	 assign DistX29 = DrawX - RectX_FS;
	 assign DistX30 = DrawX - RectX_A;
	 assign DistX31 = DrawX - RectX_A;
	 assign DistX32 = DrawX - RectX_FS;
	 assign DistX33 = DrawX - RectX_E;
	 assign DistX34 = DrawX - RectX_D;
	 assign DistX35 = DrawX - RectX_E;
	 assign DistX36 = DrawX - RectX_FS;
	 assign DistX37 = DrawX - RectX_FS;
	 assign DistX38 = DrawX - RectX_FS;
	 assign DistX39 = DrawX - RectX_FS;
	 assign DistX40 = DrawX - RectX_E;
	 assign DistX41 = DrawX - RectX_E;
	 assign DistX42 = DrawX - RectX_FS;
	 assign DistX43 = DrawX - RectX_E;
	 
	 assign DistY18 = DrawY - RectY_17;
	 assign DistY19 = DrawY - RectY_18;
	 assign DistY20 = DrawY - RectY_19;
	 assign DistY21 = DrawY - RectY_20;
	 assign DistY22 = DrawY - RectY_21;
	 assign DistY23 = DrawY - RectY_22;
	 assign DistY24 = DrawY - RectY_23;
	 assign DistY25 = DrawY - RectY_24;
	 assign DistY26 = DrawY - RectY_25;
	 assign DistY27 = DrawY - RectY_26;
	 assign DistY28 = DrawY - RectY_27;
	 assign DistY29 = DrawY - RectY_28;
	 assign DistY30 = DrawY - RectY_29;
	 assign DistY31 = DrawY - RectY_30;
	 assign DistY32 = DrawY - RectY_31;
	 assign DistY33 = DrawY - RectY_32;
	 assign DistY34 = DrawY - RectY_33;
	 assign DistY35 = DrawY - RectY_34;
	 assign DistY36 = DrawY - RectY_35;
	 assign DistY37 = DrawY - RectY_36;
	 assign DistY38 = DrawY - RectY_37;
	 assign DistY39 = DrawY - RectY_38;
	 assign DistY40 = DrawY - RectY_39;
	 assign DistY41 = DrawY - RectY_40;
	 assign DistY42 = DrawY - RectY_41;
	 assign DistY43 = DrawY - RectY_42;
	 
//	 assign RectDistX = DrawX - RectX;
//	 assign RectDistY = DrawY - RectY;
	  
    always_comb
	 begin: Draw_Song
		Red = {BG_R, 4'd0}; 
      Green = {BG_G, 4'd0};
      Blue = {BG_B, 4'd0}; 
//		RectX = 10'd0;
//		RectY = 12'd0;
//		RectWidth = 10'd0;
//		RectHeight = 10'd0;
//		RectDistX = 0;
//		RectDistY = 0;
		if (menu_on)
		begin
			Red = {MENU_R, 4'd0};
			Green = {MENU_G, 4'd0};
			Blue = {MENU_B, 4'd0};
		end
		else if (end_on)
		begin
			Red = 8'hff;//{END_R, 4'd0};
			Green = 8'hff;//{END_G, 4'd0};
			Blue = 8'hff;//{END_B, 4'd0};
		end
		else if (fail_on)
		begin
			Red = 8'h00;//{FAIL_R, 4'd0};
			Green = 8'h00;//{FAIL_G, 4'd0};
			Blue = 8'h00;//{FAIL_B, 4'd0};
		end
		else
		begin
			//if(keycode == 8'd30)
			begin
			if (DistX1 <= 10'd52 && DistY1 <= 10'd30 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX2 <= 10'd52 && DistY2 <= 10'd30 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX3 <= 10'd52 && DistY3 <= 10'd60 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX4 <= 10'd52 && DistY4 <= 10'd30 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX5 <= 10'd52 && DistY5 <= 10'd30 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX6 <= 10'd52 && DistY6 <= 10'd60 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX7 <= 10'd52 && DistY7 <= 10'd15 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX8 <= 10'd52 && DistY8 <= 10'd15 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX9 <= 10'd52 && DistY9 <= 10'd15 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX10 <= 10'd52 && DistY10 <= 10'd15 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX11 <= 10'd52 && DistY11 <= 10'd15 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX12 <= 10'd52 && DistY12 <= 10'd15 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX13 <= 10'd52 && DistY13 <= 10'd15 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX14 <= 10'd52 && DistY14 <= 10'd15 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX15 <= 10'd52 && DistY15 <= 10'd30 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX16 <= 10'd52 && DistY16 <= 10'd30 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
			else if (DistX17 <= 10'd52 && DistY17 <= 10'd60 && (DrawY < 10'd300))
			begin
				Red = 8'hff;
				Green = 8'h55;
				Blue = 8'h00;
			end
//			for(int i = 0; i < numRectangles; i++)
//			begin
//			  RectX = rectangles[((numRectangles - i) * 42) - 1 -: 10];
//			  RectY = rectangles[((numRectangles - i) * 42) - 11 -: 12];
//			  RectWidth = rectangles[((numRectangles - i) * 42) - 23 -: 10];
//			  RectHeight = rectangles[((numRectangles - i) * 42) - 33 -: 10];
//			  RectDistX = DrawX - RectX;
//			  RectDistY = DrawY - RectY;
//			  if (RectDistX <= RectWidth && RectDistY <= RectHeight && (DrawY < 10'd280))
//			  begin
//					RectX = 10'd0;
//					RectY = 12'd0;
//					RectWidth = 10'd0;
//					RectHeight = 10'd0;
//					RectDistX = 0;
//					RectDistY = 0;
//					Red = 8'hff;
//					Green = 8'h55;
//					Blue = 8'h00;
//			  end
	//		  else
	//		  begin
	//				RectX = 10'd0;
	//				RectY = 12'd0;
	//				RectWidth = 10'd0;
	//				RectHeight = 10'd0;
	//				RectDistX = 0;
	//				RectDistY = 0;
	//				Red = {VGA_R, 4'd0}; 
	//            Green = {VGA_G, 4'd0};
	//            Blue = {VGA_B, 4'd0};
	//		  end
	//		  if ((rect_on == 1'b1) && (DrawY < 10'd280)) 
	//        begin 
	//            Red = 8'hff;
	//            Green = 8'h55;
	//            Blue = 8'h00;
	//        end       
	//        else 
	//        begin 
	//            Red = {VGA_R, 4'd0}; 
	//            Green = {VGA_G, 4'd0};
	//            Blue = {VGA_B, 4'd0};
	//        end
			//end
		end
	 end
	 
	 always_comb
    begin:Ball_on_proc
        if ( (DistX * DistX + DistY*DistY) <= (Size * Size) ) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 
       
//    always_comb
//    begin:RGB_Display
//        if ((rect_on == 1'b1) && (DrawY < 10'd275)) 
//        begin 
//            Red = 8'hff;
//            Green = 8'h55;
//            Blue = 8'h00;
//        end       
//        else 
//        begin 
//            Red = {VGA_R, 4'd0}; 
//            Green = {VGA_G, 4'd0};
//            Blue = {VGA_B, 4'd0};
//        end      
//    end 
    
endmodule
