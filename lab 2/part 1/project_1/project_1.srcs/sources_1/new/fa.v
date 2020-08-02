`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2019 01:50:50 PM
// Design Name: 
// Module Name: fa
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


module fa( a, b, cin, cout, sum);
input    a, b, cin;
output  cout, sum;

wire  m, n, p;


ha    g1 (.cout(n), .sum(m), .a(a), .b(b) );
ha    g2 (.cout(p), .sum(sum), .a(cin), .b(m) );

assign cout = p | n;

endmodule