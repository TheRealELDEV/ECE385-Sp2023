/************************************************************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/
`define NUM_REGS 601 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [9:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

logic [31:0] LOCAL_REG       [`NUM_REGS]; // Registers
//put other local variables here
logic blank, VGA_Clk, sync;
logic [9:0] DrawX, DrawY;
//logic [31:0] Word;
logic [10:0] Code;
logic Ivn;
//logic [10:0] sprite_addr;
logic [0:7] sprite_data;
//logic [11:0] byteVal;
//logic [1:0] offsetX;
//logic [3:0] FGD_R, FGD_G, FGD_B, BGD_R, BGD_G, BGD_B;
//int MSB[3:0] = '{31, 23, 15, 7};
//int LSB[3:0] = '{24, 16, 8, 0};
//logic [10:0] address;
//logic [6:0] charX;
//logic [1:0] codeNum;
//logic [2:0] bitNum;
//logic [7:0] bitRow3, bitRow2, bitRow1, bitRow0;
//logic pixelVal;
//logic Ivn;

//Declare submodules..e.g. VGA controller, ROMS, etc
vga_controller vga(.Clk(CLK), .Reset(RESET), .hs(hs), .vs(vs), .pixel_clk(VGA_Clk), .blank(blank), .sync(sync), .DrawX(DrawX), .DrawY(DrawY));
font_rom row(.addr({Code[6:0], DrawY[3:0]}), .data(sprite_data));

// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff
always_ff @(posedge CLK) begin
	//AVL_READDATA <= 32'h00000000;

		if(AVL_READ && AVL_CS)
		begin
			AVL_READDATA <= LOCAL_REG[AVL_ADDR];
		end 
		if(AVL_WRITE && AVL_CS)
		begin
			unique case(AVL_BYTE_EN)
				4'b1111 : LOCAL_REG[AVL_ADDR] <= AVL_WRITEDATA;
				4'b1100 : LOCAL_REG[AVL_ADDR][31:16] <= AVL_WRITEDATA[31:16];
				4'b0011 : LOCAL_REG[AVL_ADDR][15:0] <= AVL_WRITEDATA[15:0];
				4'b1000 : LOCAL_REG[AVL_ADDR][31:24] <= AVL_WRITEDATA[31:24];
				4'b0100 : LOCAL_REG[AVL_ADDR][23:16] <= AVL_WRITEDATA[23:16];
				4'b0010 : LOCAL_REG[AVL_ADDR][15:8] <= AVL_WRITEDATA[15:8];
				4'b0001 : LOCAL_REG[AVL_ADDR][7:0] <= AVL_WRITEDATA[7:0];
			endcase
		end
	end


//handle drawing (may either be combinational or sequential - or both).

//assign Control = LOCAL_REG[600];
//assign FGD_R = LOCAL_REG[`CTRL_REG][24:21];
//assign FGD_G = LOCAL_REG[`CTRL_REG][20:17];
//assign FGD_B = LOCAL_REG[`CTRL_REG][16:13];
//assign BGD_R = LOCAL_REG[`CTRL_REG][12:9];
//assign BGD_G = LOCAL_REG[`CTRL_REG][8:5];
//assign BGD_B = LOCAL_REG[`CTRL_REG][4:1];

always_comb
begin
	//cX = DrawX[9:3];
	//cY = DrawY[9:4];
	//byteVal = ({DrawY[9:4], 4'h0} * 5) + DrawX[9:3];
	//offsetX = (({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[1:0];
	//Word = LOCAL_REG[(({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[11:2]];
//	if((({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[1:0] == 2'b00)
//	begin
//		Code = (LOCAL_REG[(({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[11:2]])[6:0]; // Word[6:0]
//		Ivn = (LOCAL_REG[(({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[11:2]])[7]; // Word[7]
//	end
//	else if((({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[1:0] == 2'b01)
//	begin
//		Code = (LOCAL_REG[(({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[11:2]])[14:8];
//		Ivn = (LOCAL_REG[(({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[11:2]])[15];
//	end
//	else if((({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[1:0] == 2'b10)
//	begin
//		Code = (LOCAL_REG[(({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[11:2]])[22:16];
//		Ivn = (LOCAL_REG[(({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[11:2]])[23];
//	end
//	else
//	begin
//		Code = (LOCAL_REG[(({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[11:2]])[30:24];
//		Ivn = (LOCAL_REG[(({DrawY[9:4], 4'h0} * 5) + DrawX[9:3])[11:2]])[31];
//	end
	Code = LOCAL_REG[DrawY[9:4]*20 + DrawX[9:5]][{DrawX[4:3], 3'd0} +: 7];
	Ivn = LOCAL_REG[DrawY[9:4]*20 + DrawX[9:5]][{DrawX[4:3], 3'd7}];
	//sprite_addr = (DrawY[3:0]) + {Code[6:0], 4'h0};
end

always_ff @ (posedge VGA_Clk)
begin
	 if (~blank) 
	 begin
		red <= 4'd0;
		green <= 4'd0;
		blue <= 4'd0;
	 end
	 else if(sprite_data[DrawX[2:0]] ^ Ivn)
	 begin
		red <= LOCAL_REG[`CTRL_REG][24:21];
		green <= LOCAL_REG[`CTRL_REG][20:17];
		blue <= LOCAL_REG[`CTRL_REG][16:13];
	 end
	 else
	 begin
		red <= LOCAL_REG[`CTRL_REG][12:9];
		green <= LOCAL_REG[`CTRL_REG][8:5];
		blue <= LOCAL_REG[`CTRL_REG][4:1];
	 end
end
endmodule

//always_comb
//begin
//	charX = DrawX / 8;
//	codeNum = charX % 4;
//	if (codeNum == 2'b00)
//	begin
//		address = (DrawY % 16) + (AVL_READDATA[30:24] * 16);
//		Ivn = AVL_READDATA[31];
//	end
//	else if (codeNum == 2'b01)
//	begin
//		address = (DrawY % 16) + (AVL_READDATA[22:16] * 16);
//		Ivn = AVL_READDATA[23];
//	end
//	else if (codeNum == 2'b10)
//	begin
//		address = (DrawY % 16) + (AVL_READDATA[14:8] * 16);
//		Ivn = AVL_READDATA[15];
//	end
//	else
//	begin
//		address = (DrawY % 16) + (AVL_READDATA[6:0] * 16);
//		Ivn = AVL_READDATA[7];
//	end
//	bitNum = DrawX % 8;
//end
//
//font_rom font3(.addr(address), .data(bitRow3));
//always_comb
//begin
//	pixelVal = bitRow3[bitNum];
//	if (pixelVal && Ivn)
//	begin
//		red = LOCAL_REG[600][12:9];
//		green = LOCAL_REG[600][8:5];
//		blue = LOCAL_REG[600][4:1];
//	end
//	else if (pixelVal && !Ivn)
//	begin
//		red = LOCAL_REG[600][24:21];
//		green = LOCAL_REG[600][20:17];
//		blue = LOCAL_REG[600][16:13];
//	end
//	else if (!pixelVal && Ivn)
//	begin
//		red = LOCAL_REG[600][24:21];
//		green = LOCAL_REG[600][20:17];
//		blue = LOCAL_REG[600][16:13];
//	end
//	else
//	begin
//		red = LOCAL_REG[600][12:9];
//		green = LOCAL_REG[600][8:5];
//		blue = LOCAL_REG[600][4:1];
//	end
//		
//end
//
//
//always_comb
//begin
//	if (AVL_READDATA[31])
//		bitRow3 = ~bitRow3;
//	if (AVL_READDATA[23])
//		bitRow2 = ~bitRow2;
//	if (AVL_READDATA[15])
//		bitRow1 = ~bitRow1;
//	if (AVL_READDATA[7])
//		bitRow0 = ~bitRow0;
//end

   