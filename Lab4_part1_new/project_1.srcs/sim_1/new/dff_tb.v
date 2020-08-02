`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2019 01:39:27 PM
// Design Name: 
// Module Name: dff_tb
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


module dff_tb;
reg [3:0] D,CE;
reg CLK,CLR;
wire [3:0] Q;

dff G1(CLK,CLR,CE,D,Q);

always #10 CLK = ~CLK;

initial 
begin
    CLK = 0;
    CLR = 1;
    CE = 1;
    D = 4'b1010;
    #6 CLR = 0;
    #5 D = 4'b0000;
    #20 D = 4'b1111;
    #20 D = 4'b0010;
    #15 $stop;
    
end 
endmodule
