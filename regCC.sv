module regCC
(
input Clk, Reset, LD_CC, LD_BEN,
input logic [2:0] CCIn,
input logic BENIn,
output logic [2:0] CCOut,
output logic BENOut
);

reg_3 CC(.*, .Load(LD_CC), .Din(CCIn), .Dout(CCOut));
flipflop BEN(.*, .Load(LD_BEN), .Din(BENIn), .Dout(BENOut));

endmodule

