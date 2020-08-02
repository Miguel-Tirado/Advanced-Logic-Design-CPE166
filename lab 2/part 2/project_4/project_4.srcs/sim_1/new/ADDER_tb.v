`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 03:55:31 PM
// Design Name: 
// Module Name: ADDER_tb
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


module ADDER_tb;
reg [3:0] a,b;

wire [3:0] sum;
wire cout; 

ADDER g1(.a(a), .b(b), .sum(sum), .cout(cout));

initial begin
    a = 4'b0000; b = 4'b0001;
    #10
    a = 4'b1000; b = 4'b0101;
    #10
    a = 4'b0011; b = 4'b0101;
    #10
    a = 4'b1010; b = 4'b0101;
    #10 $stop;
end 
endmodule
