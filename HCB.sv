module HCB
(
input frame_clk, Reset,
output logic [6:0] numRectangles,
output logic [730:0] rectangles
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
logic [12:0] RectY_14, RectY_15, RectY_16;

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

assign numRectangles = 7'd17;
assign rectangles = {{RectX_FS, RectY_0, 10'd20, 10'd30}, {RectX_E, RectY_1, 10'd20, 10'd30},
{RectX_D, RectY_2, 10'd20, 10'd60}, {RectX_FS, RectY_3, 10'd20, 10'd30}, {RectX_E, RectY_4, 10'd20, 10'd30},
{RectX_D, RectY_5, 10'd20, 10'd60}, {RectX_D, RectY_6, 10'd20, 10'd15}, {RectX_D, RectY_7, 10'd20, 10'd15},
{RectX_D, RectY_8, 10'd20, 10'd15}, {RectX_D, RectY_9, 10'd20, 10'd15}, {RectX_E, RectY_10, 10'd20, 10'd15},
{RectX_E, RectY_11, 10'd20, 10'd15}, {RectX_E, RectY_12, 10'd20, 10'd15}, {RectX_E, RectY_13, 10'd20, 10'd15},
{RectX_FS, RectY_14, 10'd20, 10'd30}, {RectX_E, RectY_15, 10'd20, 10'd30}, {RectX_D, RectY_16, 10'd20, 10'd60}};

endmodule

