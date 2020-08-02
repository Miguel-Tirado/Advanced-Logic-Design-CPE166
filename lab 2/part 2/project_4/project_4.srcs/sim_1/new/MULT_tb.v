`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2019 02:43:36 PM
// Design Name: 
// Module Name: MULT_tb
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


module MULT_tb;
 reg [3:0] da, db;
 reg ld, shb, clr, clk, shp, ldp;
 wire [7:0] p;
 
 MULT g1(da, db, p, ld, shb, clr, clk, shp, ldp);
 
 initial clk = 0;
 always #10 clk = ~clk;
 
 initial begin
     da = 4'b1011; db = 4'b1101; ld = 0; shb = 0; clr = 1; shp = 0; ldp = 0;
     #20 clr = 0;
     #20 ld = 1;
     #20 ld = 0;
     
     #20 ldp = 1;
     #20 ldp = 0;
     
     #20 shb = 1;
     #20 shb = 0;
     
     #20 shp = 1;
     #20 shp = 0;
     
     #20 ldp = 1;
     #20 ldp = 0;
     
     #20 shb = 1;
     #20 shb = 0;
     
     #20 shp = 1;
     #20 shp = 0;
     
     #20 ldp = 1;
     #20 ldp = 0;
     
     #20 shb = 1;
     #20 shb = 0;
     
     #20 shp = 1;
     #20 shp = 0;
     
     #20 ldp = 1;
     #20 ldp = 0;
     
     
     #20 $stop;

 end
endmodule
