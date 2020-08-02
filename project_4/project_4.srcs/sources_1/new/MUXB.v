`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 03:32:40 PM
// Design Name: 
// Module Name: MUXB
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


module MUXB(d1, d0, s, y);
input [3:0]    d1, d0; 
input          s;
output [3:0]  y;
reg    [3:0]  y;

always@(d1 or d0 or s)
begin
   if (s)  y = d1;
   else   y = d0;
end

endmodule
