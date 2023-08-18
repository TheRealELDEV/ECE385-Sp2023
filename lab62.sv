//-------------------------------------------------------------------------
//                                                                       --
//                                                                       --
//      For use with ECE 385 Lab 62                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab62 (

      ///////// Clocks /////////
      input     MAX10_CLK1_50, 

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 

);




logic Reset_h, vssig, blank, sync, VGA_Clk;


//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST, I2C0_SDA_IN, I2C0_SCL_IN, I2C0_SDA_OE, I2C0_SCL_OE, SCLK, LRCLK;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs, aud_mclk_ctr;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	logic [7:0] Red, Blue, Green;
	logic [7:0] keycode; 
	logic [8:0] x_displacement, y_displacement;
	logic [2:0] mouse_button;
	logic [6:0] read_addr;

//=======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assignments for I2C
	assign ARDUINO_IO[15] = I2C0_SCL_OE ? 1'b0 : 1'bz;
	assign I2C0_SCL_IN = ARDUINO_IO[15];
	assign ARDUINO_IO[14] = I2C0_SDA_OE ? 1'b0 : 1'bz;
	assign I2C0_SDA_IN = ARDUINO_IO[14];
	assign ARDUINO_IO[3] = aud_mclk_ctr[1];
	always_ff @ (posedge MAX10_CLK1_50)
	begin
		aud_mclk_ctr <= aud_mclk_ctr + 1;
	end
	
	//Assignments for I2S
	initial
	begin
		read_addr = 7'd0;
	end
	assign LRCLK = ARDUINO_IO[4];
	assign SCLK = ARDUINO_IO[5];
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver4 (hex_num_4, HEX4[6:0]);
	assign HEX4[7] = 1'b1;
	
	HexDriver hex_driver3 (hex_num_3, HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	
	HexDriver hex_driver1 (hex_num_1, HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (hex_num_0, HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
	assign VGA_R = Red[7:4];
	assign VGA_B = Blue[7:4];
	assign VGA_G = Green[7:4];
	
	
	finalproject_soc u0 (
		.clk_clk                           (MAX10_CLK1_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//I2C
		.i2c0_sda_in(I2C0_SDA_IN),
		.i2c0_scl_in(I2C0_SCL_IN),
		.i2c0_sda_oe(I2C0_SDA_OE),
		.i2c0_scl_oe(I2C0_SCL_OE),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		.keycode_export(keycode),
		.x_displacement_external_connection_export(x_displacement), 
		.y_displacement_external_connection_export(y_displacement),
		.mouse_button_external_connection_export(mouse_button)
	 );

logic [5:0] wav;
logic [31:0] samp;
always_ff @(posedge LRCLK)
begin
	wav <= wav + 1;
end

always_comb
begin
	if (wav[5])
	begin
		samp = 32'h06600000;
	end
	else
	begin
		samp = 32'h09A00000;
	end
end

always_ff @ (posedge SCLK)
begin
	if(read_addr >= len)
		read_addr <= 7'd0;
	else
		read_addr <= read_addr + 1;
end

logic i2s_out;
logic [6:0] len;
logic [31:0] ram_out;
logic [3:0] BG_R, BG_G, BG_B, FG_R, FG_G, FG_B;
logic [9:0] RectX, RectY, RectXSize, RectYSize;
logic [4999:0] rectangles;
logic [6:0] numRectangles;
logic menu_on, end_on, fail_on;
logic [2:0] song_select;

//always_ff @ (posedge VGA_Clk)
//begin
//	VGA_R <= BG_R;
//	VGA_G <= BG_G;
//	VGA_B <= BG_B;
//end

assign ARDUINO_IO[2] = ARDUINO_IO[1];
assign ARDUINO_IO[1] = i2s_out;
//instantiate a vga_controller, ball, and color_mapper here with the ports.
audioROM rom0(.data_In(32'dx), .write_address(15'dx), .read_address(read_addr), .we(1'd0), .Clk(wav[1]), .keycode(keycode), .len(len), .data_Out(ram_out));
i2s i2s0(.SCLK(SCLK), .LRCLK(LRCLK), .Din(ram_out), .Dout(i2s_out));
vga_controller vga0(.Clk(MAX10_CLK1_50), .Reset(Reset_h), .hs(VGA_HS), .vs(VGA_VS), .pixel_clk(VGA_Clk), .blank(blank), .sync(sync), .DrawX(drawxsig), .DrawY(drawysig));
ball b0 (.Reset(Reset_h), .frame_clk(VGA_VS), .keycode(keycode), .x_displacement(x_displacement), .y_displacement(y_displacement), .mouse_button(mouse_button), .BallX(ballxsig), .BallY(ballysig), .BallS(ballsizesig));
//newbackground_example ex(.vga_clk(VGA_Clk), .DrawX(drawxsig), .DrawY(drawysig), .blank(blank), .red(BG_R), .green(BG_G), .blue(BG_B));
//fallingblocks_example examp(.vga_clk(VGA_Clk), .DrawX(drawxsig), .DrawY(drawysig), .blank(blank), .red(FG_R), .green(FG_G), .blue(FG_B));
//rectangle r0 (.frame_clk(VGA_VS), .Reset(Reset_h), .RectX(RectX), .RectY(RectY), .RectXSize(RectXSize), .RectYSize(RectYSize));
color_mapper cm0(.keycode(keycode), .BallX(ballxsig), .BallY(ballysig), .DrawX(drawxsig), .DrawY(drawysig), .Ball_size(ballsizesig), .vga_clk(VGA_Clk), .frame_clk(VGA_VS), .Reset(Reset_h), .blank(blank), .menu_on(menu_on), .end_on(end_on), .fail_on(fail_on), .rectangles(rectangles), .numRectangles(numRectangles), /*.RectX(RectX), .RectY(RectY), .RectWidth(RectXSize), .RectHeight(RectYSize),*/ .Red(Red), .Green(Green), .Blue(Blue));
//TTLS song1(.frame_clk(VGA_VS), .Reset(Reset_h), .numRectangles(numRectangles), .rectangles(rectangles));
song_interface songs(.frame_clk(VGA_VS), .Reset(Reset_h), .song_select(song_select), .numRectangles(numRectangles), .rectangles(rectangles));
Control FSM(.Clk(MAX10_CLK1_50), .Reset(Reset_h), .keycode(keycode), .menu_on(menu_on), .end_on(end_on), .fail_on(fail_on), .song_select(song_select));

endmodule
