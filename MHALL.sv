module MHALL
(
input frame_clk, Reset,
output logic [6:0] numRectangles,
output logic [1117:0] rectangles
);

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

logic [12:0] RectY_0, RectY_1, RectY_2, RectY_3, RectY_4, RectY_5, RectY_6;
logic [12:0] RectY_7, RectY_8, RectY_9, RectY_10, RectY_11, RectY_12, RectY_13;
logic [12:0] RectY_14, RectY_15, RectY_16, RectY_17, RectY_18, RectY_19, RectY_20;
logic [12:0] RectY_21, RectY_22, RectY_23, RectY_24, RectY_25;

rectangle r0(.*, .startY(13'd0), .RectY(RectY_0)); // F#
rectangle r1(.*, .startY(-13'd40), .RectY(RectY_1)); // E
rectangle r2(.*, .startY(-13'd80), .RectY(RectY_2)); // D
rectangle r3(.*, .startY(-13'd120), .RectY(RectY_3)); // E
rectangle r4(.*, .startY(-13'd160), .RectY(RectY_4)); // F#
rectangle r5(.*, .startY(-13'd200), .RectY(RectY_5)); // F#
rectangle r6(.*, .startY(-13'd270), .RectY(RectY_6)); // F#
rectangle r7(.*, .startY(-13'd320), .RectY(RectY_7)); // E
rectangle r8(.*, .startY(-13'd360), .RectY(RectY_8)); // E
rectangle r9(.*, .startY(-13'd430), .RectY(RectY_9)); // E
rectangle r10(.*, .startY(-13'd480), .RectY(RectY_10)); // F#
rectangle r11(.*, .startY(-13'd520), .RectY(RectY_11)); // A
rectangle r12(.*, .startY(-13'd590), .RectY(RectY_12)); // A
rectangle r13(.*, .startY(-13'd640), .RectY(RectY_13)); // F#
rectangle r14(.*, .startY(-13'd680), .RectY(RectY_14)); // E
rectangle r15(.*, .startY(-13'd720), .RectY(RectY_15)); // D
rectangle r16(.*, .startY(-13'd760), .RectY(RectY_16)); // E
rectangle r17(.*, .startY(-13'd800), .RectY(RectY_17)); // F#
rectangle r18(.*, .startY(-13'd840), .RectY(RectY_18)); // F#
rectangle r19(.*, .startY(-13'd880), .RectY(RectY_19)); // F#
rectangle r20(.*, .startY(-13'd920), .RectY(RectY_20)); // F#
rectangle r21(.*, .startY(-13'd960), .RectY(RectY_21)); // E
rectangle r22(.*, .startY(-13'd1000), .RectY(RectY_22)); // E
rectangle r23(.*, .startY(-13'd1040), .RectY(RectY_23)); // F#
rectangle r24(.*, .startY(-13'd1080), .RectY(RectY_24)); // E
rectangle r25(.*, .startY(-13'd1180), .RectY(RectY_25)); // D

assign numRectangles = 7'd26;
assign rectangles = {{RectX_FS, RectY_0, 10'd20, 10'd30}, {RectX_E, RectY_1, 10'd20, 10'd30},
{RectX_D, RectY_2, 10'd20, 10'd30}, {RectX_E, RectY_3, 10'd20, 10'd30}, {RectX_FS, RectY_4, 10'd20, 10'd30},
{RectX_FS, RectY_5, 10'd20, 10'd30}, {RectX_FS, RectY_6, 10'd20, 10'd60}, {RectX_E, RectY_7, 10'd20, 10'd30},
{RectX_E, RectY_8, 10'd20, 10'd30}, {RectX_E, RectY_9, 10'd20, 10'd60}, {RectX_FS, RectY_10, 10'd20, 10'd30},
{RectX_A, RectY_11, 10'd20, 10'd30}, {RectX_A, RectY_12, 10'd20, 10'd60}, {RectX_FS, RectY_13, 10'd20, 10'd30},
{RectX_E, RectY_14, 10'd20, 10'd30}, {RectX_D, RectY_15, 10'd20, 10'd30}, {RectX_E, RectY_16, 10'd20, 10'd30},
{RectX_FS, RectY_17, 10'd20, 10'd30}, {RectX_FS, RectY_18, 10'd20, 10'd30}, {RectX_FS, RectY_19, 10'd20, 10'd30},
{RectX_FS, RectY_20, 10'd20, 10'd30}, {RectX_E, RectY_21, 10'd20, 10'd30}, {RectX_E, RectY_22, 10'd20, 10'd30},
{RectX_FS, RectY_23, 10'd20, 10'd30}, {RectX_E, RectY_24, 10'd20, 10'd30}, {RectX_D, RectY_25, 10'd20, 10'd90}};

endmodule

