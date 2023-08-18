module VLV
(
input frame_clk, Reset,
output logic [6:0] numRectangles,
output logic [3052:0] rectangles
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
logic [12:0] RectY_42, RectY_43, RectY_44, RectY_45, RectY_46, RectY_47, RectY_48;
logic [12:0] RectY_49, RectY_50, RectY_51, RectY_52, RectY_53, RectY_54, RectY_55;
logic [12:0] RectY_56, RectY_57, RectY_58, RectY_59, RectY_60, RectY_61, RectY_62;
logic [12:0] RectY_63, RectY_64, RectY_65, RectY_66, RectY_67, RectY_68, RectY_69;
logic [12:0] RectY_70;

rectangle r0(.*, .startY(13'd0), .RectY(RectY_0)); // C#
rectangle r1(.*, .startY(-13'd20), .RectY(RectY_1)); // C#
rectangle r2(.*, .startY(-13'd40), .RectY(RectY_2)); // C#
rectangle r3(.*, .startY(-13'd135), .RectY(RectY_3)); // C#
rectangle r4(.*, .startY(-13'd180), .RectY(RectY_4)); // D
rectangle r5(.*, .startY(-13'd275), .RectY(RectY_5)); // B
rectangle r6(.*, .startY(-13'd335), .RectY(RectY_6)); // B
rectangle r7(.*, .startY(-13'd360), .RectY(RectY_7)); // A
rectangle r8(.*, .startY(-13'd395), .RectY(RectY_8)); // B
rectangle r9(.*, .startY(-13'd420), .RectY(RectY_9)); // B
rectangle r10(.*, .startY(-13'd440), .RectY(RectY_10)); // A
rectangle r11(.*, .startY(-13'd475), .RectY(RectY_11)); // C#
rectangle r12(.*, .startY(-13'd500), .RectY(RectY_12)); // E
rectangle r13(.*, .startY(-13'd565), .RectY(RectY_13)); // F#
rectangle r14(.*, .startY(-13'd600), .RectY(RectY_14)); // C#
rectangle r15(.*, .startY(-13'd620), .RectY(RectY_15)); // C#
rectangle r16(.*, .startY(-13'd640), .RectY(RectY_16)); // C#
rectangle r17(.*, .startY(-13'd660), .RectY(RectY_17)); // C#
rectangle r18(.*, .startY(-13'd695), .RectY(RectY_18)); // C#
rectangle r19(.*, .startY(-13'd795), .RectY(RectY_19)); // C#
rectangle r20(.*, .startY(-13'd840), .RectY(RectY_20)); // D
rectangle r21(.*, .startY(-13'd935), .RectY(RectY_21)); // B
rectangle r22(.*, .startY(-13'd995), .RectY(RectY_22)); // B
rectangle r23(.*, .startY(-13'd1020), .RectY(RectY_23)); // A
rectangle r24(.*, .startY(-13'd1055), .RectY(RectY_24)); // B
rectangle r25(.*, .startY(-13'd1095), .RectY(RectY_25)); // B
rectangle r26(.*, .startY(-13'd1135), .RectY(RectY_26)); // B
rectangle r27(.*, .startY(-13'd1160), .RectY(RectY_27)); // C#
rectangle r28(.*, .startY(-13'd1180), .RectY(RectY_28)); // A
rectangle r29(.*, .startY(-13'd1215), .RectY(RectY_29)); // F#
rectangle r30(.*, .startY(-13'd1285), .RectY(RectY_30)); // E
rectangle r31(.*, .startY(-13'd1310), .RectY(RectY_31)); // F#
rectangle r32(.*, .startY(-13'd1330), .RectY(RectY_32)); // F#
rectangle r33(.*, .startY(-13'd1350), .RectY(RectY_33)); // F#
rectangle r34(.*, .startY(-13'd1370), .RectY(RectY_34)); // E
rectangle r35(.*, .startY(-13'd1390), .RectY(RectY_35)); // F#
rectangle r36(.*, .startY(-13'd1410), .RectY(RectY_36)); // E
rectangle r37(.*, .startY(-13'd1430), .RectY(RectY_37)); // B
rectangle r38(.*, .startY(-13'd1480), .RectY(RectY_38)); // C#
rectangle r39(.*, .startY(-13'd1525), .RectY(RectY_39)); // D
rectangle r40(.*, .startY(-13'd1565), .RectY(RectY_40)); // E
rectangle r41(.*, .startY(-13'd1605), .RectY(RectY_41)); // E
rectangle r42(.*, .startY(-13'd1630), .RectY(RectY_42)); // E
rectangle r43(.*, .startY(-13'd1650), .RectY(RectY_43)); // C#
rectangle r44(.*, .startY(-13'd1670), .RectY(RectY_44)); // E
rectangle r45(.*, .startY(-13'd1690), .RectY(RectY_45)); // C#
rectangle r46(.*, .startY(-13'd1725), .RectY(RectY_46)); // F#
rectangle r47(.*, .startY(-13'd1745), .RectY(RectY_47)); // G#
rectangle r48(.*, .startY(-13'd1810), .RectY(RectY_48)); // A
rectangle r49(.*, .startY(-13'd1870), .RectY(RectY_49)); // F#
rectangle r50(.*, .startY(-13'd1910), .RectY(RectY_50)); // F#
rectangle r51(.*, .startY(-13'd1935), .RectY(RectY_51)); // F#
rectangle r52(.*, .startY(-13'd1955), .RectY(RectY_52)); // E
rectangle r53(.*, .startY(-13'd1975), .RectY(RectY_53)); // F#
rectangle r54(.*, .startY(-13'd2010), .RectY(RectY_54)); // G#
rectangle r55(.*, .startY(-13'd2035), .RectY(RectY_55)); // G#
rectangle r56(.*, .startY(-13'd2100), .RectY(RectY_56)); // G#
rectangle r57(.*, .startY(-13'd2150), .RectY(RectY_57)); // E
rectangle r58(.*, .startY(-13'd2190), .RectY(RectY_58)); // E
rectangle r59(.*, .startY(-13'd2230), .RectY(RectY_59)); // E
rectangle r60(.*, .startY(-13'd2255), .RectY(RectY_60)); // E
rectangle r61(.*, .startY(-13'd2275), .RectY(RectY_61)); // E
rectangle r62(.*, .startY(-13'd2295), .RectY(RectY_62)); // D
rectangle r63(.*, .startY(-13'd2330), .RectY(RectY_63)); // C#
rectangle r64(.*, .startY(-13'd2355), .RectY(RectY_64)); // C#
rectangle r65(.*, .startY(-13'd2375), .RectY(RectY_65)); // C#
rectangle r66(.*, .startY(-13'd2395), .RectY(RectY_66)); // C#
rectangle r67(.*, .startY(-13'd2460), .RectY(RectY_67)); // C#
rectangle r68(.*, .startY(-13'd2540), .RectY(RectY_68)); // D
rectangle r69(.*, .startY(-13'd2620), .RectY(RectY_69)); // C#
rectangle r70(.*, .startY(-13'd2700), .RectY(RectY_70)); // A

assign numRectangles = 7'd71;
assign rectangles = {{RectX_CS, RectY_0, 10'd20, 10'd15}, {RectX_CS, RectY_1, 10'd20, 10'd15},
{RectX_CS, RectY_2, 10'd20, 10'd15}, {RectX_CS, RectY_3, 10'd20, 10'd90}, {RectX_D, RectY_4, 10'd20, 10'd15},
{RectX_B, RectY_5, 10'd20, 10'd90}, {RectX_B, RectY_6, 10'd20, 10'd30}, {RectX_A, RectY_7, 10'd20, 10'd15},
{RectX_B, RectY_8, 10'd20, 10'd30}, {RectX_B, RectY_9, 10'd20, 10'd15}, {RectX_A, RectY_10, 10'd20, 10'd15},
{RectX_CS, RectY_11, 10'd20, 10'd30}, {RectX_E, RectY_12, 10'd20, 10'd15}, {RectX_FS, RectY_13, 10'd20, 10'd60},
{RectX_CS, RectY_14, 10'd20, 10'd15}, {RectX_CS, RectY_15, 10'd20, 10'd15}, {RectX_CS, RectY_16, 10'd20, 10'd15},
{RectX_CS, RectY_17, 10'd20, 10'd15}, {RectX_CS, RectY_18, 10'd20, 10'd30}, {RectX_CS, RectY_19, 10'd20, 10'd90},
{RectX_D, RectY_20, 10'd20, 10'd15}, {RectX_B, RectY_21, 10'd20, 10'd90}, {RectX_B, RectY_22, 10'd20, 10'd30},
{RectX_A, RectY_23, 10'd20, 10'd15}, {RectX_B, RectY_24, 10'd20, 10'd30}, {RectX_B, RectY_25, 10'd20, 10'd30},
{RectX_B, RectY_26, 10'd20, 10'd30}, {RectX_CS, RectY_27, 10'd20, 10'd15}, {RectX_A, RectY_28, 10'd20, 10'd15},
{RectX_FS, RectY_29, 10'd20, 10'd30}, {RectX_E, RectY_30, 10'd20, 10'd30}, {RectX_FS, RectY_31, 10'd20, 10'd15},
{RectX_FS, RectY_32, 10'd20, 10'd15}, {RectX_FS, RectY_33, 10'd20, 10'd15}, {RectX_E, RectY_34, 10'd20, 10'd15},
{RectX_FS, RectY_35, 10'd20, 10'd15}, {RectX_E, RectY_36, 10'd20, 10'd15}, {RectX_B, RectY_37, 10'd20, 10'd15},
{RectX_CS, RectY_38, 10'd20, 10'd45}, {RectX_D, RectY_39, 10'd20, 10'd30}, {RectX_E, RectY_40, 10'd20, 10'd30},
{RectX_E, RectY_41, 10'd20, 10'd30}, {RectX_E, RectY_42, 10'd20, 10'd15}, {RectX_CS, RectY_43, 10'd20, 10'd15},
{RectX_E, RectY_44, 10'd20, 10'd15}, {RectX_CS, RectY_45, 10'd20, 10'd30}, {RectX_FS, RectY_46, 10'd20, 10'd15},
{RectX_GS, RectY_47, 10'd20, 10'd15}, {RectX_A, RectY_48, 10'd20, 10'd60}, {RectX_FS, RectY_49, 10'd20, 10'd30},
{RectX_FS, RectY_50, 10'd20, 10'd30}, {RectX_FS, RectY_51, 10'd20, 10'd15}, {RectX_E, RectY_52, 10'd20, 10'd15},
{RectX_FS, RectY_53, 10'd20, 10'd15}, {RectX_GS, RectY_54, 10'd20, 10'd30}, {RectX_GS, RectY_55, 10'd20, 10'd15},
{RectX_GS, RectY_56, 10'd20, 10'd60}, {RectX_E, RectY_57, 10'd20, 10'd30}, {RectX_E, RectY_58, 10'd20, 10'd30},
{RectX_E, RectY_59, 10'd20, 10'd30}, {RectX_E, RectY_60, 10'd20, 10'd15}, {RectX_E, RectY_61, 10'd20, 10'd15},
{RectX_D, RectY_62, 10'd20, 10'd15}, {RectX_CS, RectY_63, 10'd20, 10'd30}, {RectX_CS, RectY_64, 10'd20, 10'd15},
{RectX_CS, RectY_65, 10'd20, 10'd15}, {RectX_CS, RectY_66, 10'd20, 10'd15}, {RectX_CS, RectY_67, 10'd20, 10'd60},
{RectX_D, RectY_68, 10'd20, 10'd60}, {RectX_CS, RectY_69, 10'd20, 10'd60}, {RectX_A, RectY_70, 10'd20, 10'd60}};

endmodule

