`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2019 11:22:59 AM
// Design Name: 
// Module Name: TOP
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


module TOP(reset,clk,db,da,p);
input reset,clk;
input [3:0] db,da;
output[7:0] p;

wire shb,ld,clr,ldp,shp;
MULT g1(.da(da), .db(db), .p(p), .ld(ld), .shb(shb), .clr(clr), .clk(clk), .shp(shp), .ldp(ldp));
FSM  g2(.reset(reset), .clk(clk), .shb(shb), .ld(ld),.clr(clr), .ldp(ldp), .shp(shp));

endmodule
