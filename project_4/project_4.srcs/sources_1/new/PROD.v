`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 05:37:10 PM
// Design Name: 
// Module Name: PROD
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


module PROD(sum, shp, ldp, clr, clk, cout, p);
input [3:0] sum;
input shp, ldp, clr, clk, cout;

output [7:0] p;
reg  [7:0] p;

always@(posedge clr or posedge clk) 
begin 
    if(clr) p <= 0;
    else if(ldp) p[7:3] <= {cout, sum};
    else if(shp) begin 
    p[7:3] <= {1'b0, p[7:4]};
    p[2:0] <= {p[3], p[2:1]};
    end
end 



endmodule 
