`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2019 03:14:51 PM
// Design Name: 
// Module Name: Datapath_tb
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


module Datapath_tb;
    reg[3:0] M0,M1,M2,CE;
    reg[2:0] W,S;
    reg[1:0] SEL;
    reg CLK,CLR,cin;
    wire [3:0] R0,R1,R2;
    
    Datapath uut(M0, M1, M2, cin, CLR, W, CE, SEL, S,CLK, R0, R1, R2);
    
    initial begin 
        CLR = 1'b1; W = 3'b000; CE = 4'b0000; SEL = 2'b00; S = 3'b000; CLK = 1'b0;M2 = 4'b1101;
        M0 = 4'b0100; M1 = 4'b0001;
        cin = 1'b0;
    end 
    always #1 CLK = ~CLK;
    
    initial begin
        #8; CLR = 1'b0;
        #2; CE = 4'b0011; SEL = 2'b00; S = 3'b010;
        #2; CE = 4'b1011;
        #2; CE = 4'b0011; SEL = 2'b01; S = 3'b001;
        #2; CE = 4'b1000;
        #2; CE = 4'b0100;W = 3'b100;
        #2; W = 3'b000; CE = 4'b0000; SEL = 2'b00; S = 3'b000;
        #8; $stop;
    end 
endmodule
