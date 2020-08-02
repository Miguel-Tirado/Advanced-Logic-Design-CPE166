`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2019 08:41:08 AM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
    reg [3:0] a,b;
    reg [2:0] s;
    reg cin;
    wire [3:0] y;
    
    ALU G1(a, b, s, cin, y);
    
    initial begin
            a = 4'b0001; b = 4'b0001; cin = 4'b0001; s = 3'b000;
    #10     a = 4'b0001; b = 4'b1111; cin = 4'b0001; s = 3'b001;
    #10     a = 4'b0001; b = 4'b1010; cin = 4'b0001; s = 3'b010;
    #10     a = 4'b1111; b = 4'b1111; cin = 4'b0001; s = 3'b011;
    #10     a = 4'b0001; b = 4'b0001; cin = 4'b0001; s = 3'b100;
    #10     a = 4'b0001; b = 4'b0101; cin = 4'b0001; s = 3'b101;
    #10     a = 4'b1111; b = 4'b0000; cin = 4'b0001; s = 3'b110;
    #10     a = 4'b0001; b = 4'b1111; cin = 4'b0001; s = 3'b111;
    #10     $stop;
    end 
endmodule
