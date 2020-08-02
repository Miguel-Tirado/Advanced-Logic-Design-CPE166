`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 02:30:38 PM
// Design Name: 
// Module Name: MB_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MB_tb;
reg          clk, clr, ld, shb;
reg   [3:0]  db;
wire  [3:0]  qb;

MB uut (clk, clr, ld, shb, db, qb);

initial clk = 0;
always #10 clk = ~ clk;

initial
begin
    clr = 1;  ld = 0;  shb = 0;  db = 4'b1011;
	#22	ld = 1;
	#20 shb = 1;
	#60 $stop;
end
endmodule
