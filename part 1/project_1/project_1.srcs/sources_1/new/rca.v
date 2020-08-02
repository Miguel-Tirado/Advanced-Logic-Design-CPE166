`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2019 02:16:39 PM
// Design Name: 
// Module Name: rca
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
module rca (x, y, cin, cout, sum);
input [3:0] x,y;
input       cin;

output [3:0] sum;
output      cout;

wire [2:0]  m;

fa     h1(.cout(m[0]), .sum(sum[0]), .a(x[0]), .b(y[0]), .cin(cin));
fa     h2(.cout(m[1]), .sum(sum[1]), .a(x[1]), .b(y[1]), .cin(m[0]));
fa     h3(.cout(m[2]), .sum(sum[2]), .a(x[2]), .b(y[2]), .cin(m[1]));
fa     h4(.cout(cout), .sum(sum[3]), .a(x[3]), .b(y[3]), .cin(m[2]));

endmodule