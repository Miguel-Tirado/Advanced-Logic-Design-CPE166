`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 02:51:35 PM
// Design Name: 
// Module Name: MA_tb
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


module MA_tb;
reg       clk, clr, ld;
reg [3:0] da; 

wire [3:0] qa;

MA uut(.clk(clk), .clr(clr), .ld(ld), .da(da), .qa(qa));

initial clk = 0;

always #10 clk = ~clk;

initial 
begin
    clr =1;
    da = 4'b1011;
    
    #24 clr = 0; ld = 1;
    #24 ld = 0;
    
    #60 $stop;
 end 

endmodule
