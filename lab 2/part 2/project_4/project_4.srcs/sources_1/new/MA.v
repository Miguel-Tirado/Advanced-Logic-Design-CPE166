`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 02:46:35 PM
// Design Name: 
// Module Name: MA
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


module MA(clk, clr, ld, da, qa);
input        clk, clr, ld;
input [3:0]  da;
output [3:0] qa;

reg    [3:0] qa;

always@(posedge clr or  posedge clk)
begin
    if(clr) qa <= 0;
    else if (ld)
       qa <= da;
end
endmodule
