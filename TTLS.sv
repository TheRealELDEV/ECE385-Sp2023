module TTLS
(
input frame_clk, Reset,
output logic [6:0] numRectangles,
output logic [1805:0] rectangles
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
logic [12:0] RectY_21, RectY_22, RectY_23, RectY_24, RectY_25, RectY_26, RectY_27;
logic [12:0] RectY_28, RectY_29, RectY_30, RectY_31, RectY_32, RectY_33, RectY_34;
logic [12:0] RectY_35, RectY_36, RectY_37, RectY_38, RectY_39, RectY_40, RectY_41;

rectangle r0(.*, .startY(13'd0), .RectY(RectY_0)); // D
rectangle r1(.*, .startY(-13'd40), .RectY(RectY_1)); // D
rectangle r2(.*, .startY(-13'd80), .RectY(RectY_2)); // A
rectangle r3(.*, .startY(-13'd120), .RectY(RectY_3)); // A
rectangle r4(.*, .startY(-13'd160), .RectY(RectY_4)); // B
rectangle r5(.*, .startY(-13'd200), .RectY(RectY_5)); // B
rectangle r6(.*, .startY(-13'd270), .RectY(RectY_6)); // A
rectangle r7(.*, .startY(-13'd320), .RectY(RectY_7)); // G
rectangle r8(.*, .startY(-13'd360), .RectY(RectY_8)); // G
rectangle r9(.*, .startY(-13'd400), .RectY(RectY_9)); // F#
rectangle r10(.*, .startY(-13'd440), .RectY(RectY_10)); // F#
rectangle r11(.*, .startY(-13'd480), .RectY(RectY_11)); // E
rectangle r12(.*, .startY(-13'd520), .RectY(RectY_12)); // E
rectangle r13(.*, .startY(-13'd590), .RectY(RectY_13)); // D
rectangle r14(.*, .startY(-13'd640), .RectY(RectY_14)); // A
rectangle r15(.*, .startY(-13'd680), .RectY(RectY_15)); // A
rectangle r16(.*, .startY(-13'd720), .RectY(RectY_16)); // G
rectangle r17(.*, .startY(-13'd760), .RectY(RectY_17)); // G
rectangle r18(.*, .startY(-13'd800), .RectY(RectY_18)); // F#
rectangle r19(.*, .startY(-13'd840), .RectY(RectY_19)); // F#
rectangle r20(.*, .startY(-13'd910), .RectY(RectY_20)); // E
rectangle r21(.*, .startY(-13'd960), .RectY(RectY_21)); // A
rectangle r22(.*, .startY(-13'd1000), .RectY(RectY_22)); // A
rectangle r23(.*, .startY(-13'd1040), .RectY(RectY_23)); // G
rectangle r24(.*, .startY(-13'd1080), .RectY(RectY_24)); // G
rectangle r25(.*, .startY(-13'd1120), .RectY(RectY_25)); // F#
rectangle r26(.*, .startY(-13'd1160), .RectY(RectY_26)); // F#
rectangle r27(.*, .startY(-13'd1230), .RectY(RectY_27)); // E
rectangle r28(.*, .startY(-13'd1280), .RectY(RectY_28)); // D
rectangle r29(.*, .startY(-13'd1320), .RectY(RectY_29)); // D
rectangle r30(.*, .startY(-13'd1360), .RectY(RectY_30)); // A
rectangle r31(.*, .startY(-13'd1400), .RectY(RectY_31)); // A
rectangle r32(.*, .startY(-13'd1440), .RectY(RectY_32)); // B
rectangle r33(.*, .startY(-13'd1480), .RectY(RectY_33)); // B
rectangle r34(.*, .startY(-13'd1550), .RectY(RectY_34)); // A
rectangle r35(.*, .startY(-13'd1590), .RectY(RectY_35)); // G
rectangle r36(.*, .startY(-13'd1630), .RectY(RectY_36)); // G
rectangle r37(.*, .startY(-13'd1670), .RectY(RectY_37)); // F#
rectangle r38(.*, .startY(-13'd1710), .RectY(RectY_38)); // F#
rectangle r39(.*, .startY(-13'd1750), .RectY(RectY_39)); // E
rectangle r40(.*, .startY(-13'd1790), .RectY(RectY_40)); // E
rectangle r41(.*, .startY(-13'd1860), .RectY(RectY_41)); // D

assign numRectangles = 7'd42;
assign rectangles = {{RectX_D, RectY_0, 10'd20, 10'd30}, {RectX_D, RectY_1, 10'd20, 10'd30},
{RectX_A, RectY_2, 10'd20, 10'd30}, {RectX_A, RectY_3, 10'd20, 10'd30}, {RectX_B, RectY_4, 10'd20, 10'd30},
{RectX_B, RectY_5, 10'd20, 10'd30}, {RectX_A, RectY_6, 10'd20, 10'd60}, {RectX_G, RectY_7, 10'd20, 10'd30},
{RectX_G, RectY_8, 10'd20, 10'd30}, {RectX_FS, RectY_9, 10'd20, 10'd30}, {RectX_FS, RectY_10, 10'd20, 10'd30},
{RectX_E, RectY_11, 10'd20, 10'd30}, {RectX_E, RectY_12, 10'd20, 10'd30}, {RectX_D, RectY_13, 10'd20, 10'd60},
{RectX_A, RectY_14, 10'd20, 10'd30}, {RectX_A, RectY_15, 10'd20, 10'd30}, {RectX_G, RectY_16, 10'd20, 10'd30},
{RectX_G, RectY_17, 10'd20, 10'd30}, {RectX_FS, RectY_18, 10'd20, 10'd30}, {RectX_FS, RectY_19, 10'd20, 10'd30},
{RectX_E, RectY_20, 10'd20, 10'd60}, {RectX_A, RectY_21, 10'd20, 10'd30}, {RectX_A, RectY_22, 10'd20, 10'd30},
{RectX_G, RectY_23, 10'd20, 10'd30}, {RectX_G, RectY_24, 10'd20, 10'd30}, {RectX_FS, RectY_25, 10'd20, 10'd30},
{RectX_FS, RectY_26, 10'd20, 10'd30}, {RectX_E, RectY_27, 10'd20, 10'd60}, {RectX_D, RectY_28, 10'd20, 10'd30},
{RectX_D, RectY_29, 10'd20, 10'd30}, {RectX_A, RectY_30, 10'd20, 10'd30}, {RectX_A, RectY_31, 10'd20, 10'd30},
{RectX_B, RectY_32, 10'd20, 10'd30}, {RectX_B, RectY_33, 10'd20, 10'd30}, {RectX_A, RectY_34, 10'd20, 10'd60},
{RectX_G, RectY_35, 10'd20, 10'd30}, {RectX_G, RectY_36, 10'd20, 10'd30}, {RectX_FS, RectY_37, 10'd20, 10'd30},
{RectX_FS, RectY_38, 10'd20, 10'd30}, {RectX_E, RectY_39, 10'd20, 10'd30}, {RectX_E, RectY_40, 10'd20, 10'd30},
{RectX_D, RectY_41, 10'd20, 10'd60}};

endmodule

