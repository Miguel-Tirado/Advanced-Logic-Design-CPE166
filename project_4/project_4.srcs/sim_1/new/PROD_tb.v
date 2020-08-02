`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 05:43:35 PM
// Design Name: 
// Module Name: PROD_tb
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


module PROD_tb;
reg cin, shp, ldp, clr, clk;
reg [3:0] sum;
wire [7:0] p;

PROD uu1PROD(sum, shp, ldp, clr, clk, p, cin);

initial  clk =0;
always #10 clk = ~clk;

initial 
begin
    sum = 4'b1011; cin = 1; shp = 0; ldp = 0; clr = 1;
    #10
    /*
    clr = 0;
    #10
    ldp = 1;
    #20
    ldp = 0;
    #10 
    shp = 1;
    #10
    clr = 1;
    */
    clr = 0;
    #10;
    shp = 1;
    #10
    ldp = 1;
    #10
    ldp = 0;
    #60 $stop; 
end 
endmodule
