`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2019 10:39:15 AM
// Design Name: 
// Module Name: CSA8_tb
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


module CSA8_tb;
    reg cin;
    reg [7:0] a,b;
    
    wire cout;
    wire [7:0] sum;
    
    CSA8 u1(a, b, cin, cout, sa, sb, sum);
    
    initial begin 
        cin = 1'b0; a = 8'b0000_1000; b = 8'b1001_1100;
        #10;
        cin = 1'b1; a = 8'b0000_1001; b = 8'b1101_1100;
        #10;
        cin = 1'b0; a = 8'b0000_1001; b = 8'b1001_1100;
        #10;
        cin = 1'b1; a = 8'b0100_1000; b = 8'b1001_1100;
        #10;
        cin = 1'b0; a = 8'b0010_1000; b = 8'b1001_1100;
        #10;
        cin = 1'b0; a = 8'b0100_1000; b = 8'b1001_1100;
        #10;
        cin = 1'b0; a = 8'b0100_1000; b = 8'b1001_1100;
        #10 $stop;
    end
endmodule
