`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 02:29:07 PM
// Design Name: 
// Module Name: MB
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


module MB(clk, clr, ld, shb, db, qb);
input        clk, clr, ld, shb;
input [3:0]  db;
output [3:0] qb;

reg    [3:0] qb;

always@(posedge clr or  posedge clk)
begin
    if(clr) qb <= 0;
    else if (ld)
       qb <= db;
    else if (shb)
       qb <= { 1'b0,  qb[3:1] };

       // qb[3] <= 1'b0;
       // qb[2] <= qb[3];
       // qb[1] <= qb[2];
       // qb[0] <= qb[1];

end
endmodule
