`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2019 08:24:10 PM
// Design Name: 
// Module Name: mux_2to1
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


module mux_2to1(d1, d0, s, y);
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

