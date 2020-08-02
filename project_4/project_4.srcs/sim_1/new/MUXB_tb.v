`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 03:37:59 PM
// Design Name: 
// Module Name: MUXB_tb
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


module MUXB_tb;

reg [3:0]  d1,d0;
reg s;
wire [3:0] y;

MUXB k1(d1, d0, s, y);

initial begin
           d1 = 4'b0000; d0 = 4'b0000; s= 0;
   #10     d1 = 4'b0001; d0 = 4'b0000; s= 0;
   #10     d1 = 4'b0001; d0 = 4'b0010; s= 0;
   #10     d1 = 4'b1001; d0 = 4'b0000; s= 1;
   #10     d1 = 4'b1001; d0 = 4'b1000; s= 1;
   #10     d1 = 4'b0001; d0 = 4'b1100; s= 1;
   #10     $stop;
end

initial $monitor($time, "ns, d1=%b, d0=%b, s = %b, y= %b", d1, d0, s, y);

endmodule

