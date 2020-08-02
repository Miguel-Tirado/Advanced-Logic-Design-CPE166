`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2019 10:10:42 AM
// Design Name: 
// Module Name: CSA8
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


module CSA8(a , b, cin, cout, sa, sb, sum);
    input [7:0] a, b;
    input cin;
    
    output [7:0] sa, sb, sum;
    output cout;
    
    wire c1, c2, c3, c4, m;
    
    rca  r1(.a(a[3:0]), .b(b[3:0]), .cin(0), .cout(c1), .sum(sa[3:0]));
    rca  r2(.a(a[3:0]), .b(b[3:0]), .cin(1), .cout(c2), .sum(sb[3:0]));
    
    muxb mb1(.d1(sb[3:0]), .d0(sa[3:0]), .s(cin), .y(sum[3:0]));
    mux2to1 m1(.d1(c2), .d0(c1), .s(cin), .y(m));
    
    rca  r3(.a(a[7:4]), .b(b[7:4]), .cin(0), .cout(c3), .sum(sa[7:4]));
    rca  r4(.a(a[7:4]), .b(b[7:4]), .cin(1), .cout(c4), .sum(sb[7:4]));
    
    muxb mb2(.d1(sb[7:4]), .d0(sa[7:4]), .s(m), .y(sum[7:4]));
    mux2to1 m2(.d1(c4), .d0(c3), .s(m), .y(cout));
    
    

    
endmodule
