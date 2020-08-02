`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2019 02:04:51 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(M0, M1, M2, cin, CLR, W, CE, SEL, S,CLK, R0, R1, R2);
    input [3:0] M0,M1,M2,CE;
    input [2:0] W,S;
    input [1:0] SEL;
    input CLK,CLR,cin;
    output [3:0] R0,R1,R2; //deafulted wire type 
    
    wire [3:0] Y0,Y1,Y2,Y3,null,A,B;
    assign null = 4'b0000;
    
    mux_2to1 m0 (.d0(M0),.d1(A), .s(W[0]), .y(Y0)); 
    mux_2to1 m1 (.d0(M1),.d1(A), .s(W[1]), .y(Y1)); 
    mux_2to1 m2 (.d0(M2),.d1(A), .s(W[2]), .y(Y2)); 
    
    dff n0 (.CLK(CLK), .CLR(CLR), .CE(CE[0]),.D(Y0),.Q(R0));
    dff n1 (.CLK(CLK), .CLR(CLR), .CE(CE[1]),.D(Y1),.Q(R1));
    dff n2 (.CLK(CLK), .CLR(CLR), .CE(CE[2]),.D(Y2),.Q(R2));
    dff n3 (.CLK(CLK), .CLR(CLR), .CE(CE[3]),.D(Y3),.Q(A));
    
    mux_4to1 u1 (.d0(R0),.d1(R1),.d2(R2),.d3(null),.sel(SEL),.y(B));
    
    ALU a1 (.a(A),.b(B),.s(S),.cin(cin),.y(Y3));
endmodule
