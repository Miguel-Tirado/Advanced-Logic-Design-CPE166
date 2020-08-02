`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2019 01:40:26 PM
// Design Name: 
// Module Name: ha
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


module ha( a, b, cout, sum);
input    a, b;
output  cout, sum;

assign  cout = a & b;
assign sum = a ^ b;

// xor    g1 (sum, a, b);
// and   g2 (cout, a, b);

endmodule
