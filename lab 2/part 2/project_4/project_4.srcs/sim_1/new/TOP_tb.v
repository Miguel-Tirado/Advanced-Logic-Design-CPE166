`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2019 11:46:33 AM
// Design Name: 
// Module Name: TOP_tb
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


module TOP_tb;
reg [3:0] da,db;
reg reset, clk;
wire [7:0] p;

TOP g1(reset,clk,db,da,p);

initial clk =0;
always #10 clk = ~clk;

initial begin
    //da = 4'b1011; db = 4'b1101; reset = 1;
    //da = 4'b1010; db = 4'b1010; reset = 1; 
    da = 4'b1011; db = 4'b1101; reset = 1; 
    #20 reset = 0;
    #400 $stop;
end
endmodule
