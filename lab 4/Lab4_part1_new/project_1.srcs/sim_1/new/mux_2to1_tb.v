`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2019 08:26:34 PM
// Design Name: 
// Module Name: mux_2to1_tb
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


module mux_2to1_tb;
reg [3:0]  d1,d0;
reg s;
wire [3:0] y;

mux_2to1 k1(d1, d0, s, y);

initial begin
           d1 = 4'b0000; d0 = 4'b0000; s= 0;
   #10     d1 = 4'b0001; d0 = 4'b0000; s= 0;
   #10     d1 = 4'b0001; d0 = 4'b0010; s= 0;
   #10     d1 = 4'b1001; d0 = 4'b0000; s= 1;
   #10     d1 = 4'b1001; d0 = 4'b1000; s= 1;
   #10     d1 = 4'b0001; d0 = 4'b1100; s= 1;
   #10     $stop;
end

endmodule
