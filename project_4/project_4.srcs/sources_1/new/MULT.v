`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2019 01:19:38 PM
// Design Name: 
// Module Name: MULT
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


module MULT(da, db, p, ld, shb, clr, clk, shp, ldp);

input [3:0] db , da;
input ld, ldp, shb, shp, clk, clr;

output [7:0] p;

wire [3:0] null, a, qa, mux_out, add_out, qb;
wire cout;

assign null = 4'b0000;

MB g1 (.clk(clk), .clr(clr), .ld(ld), .shb(shb), .db(db), .qb(qb));

MA g2 (.clk(clk), .clr(clr), .ld(ld), .da(da), .qa(qa));

MUXB g3 (.d1(qa), .d0(null), .s(qb[0]), .y(mux_out));

ADDER g4 (.a(p[6:3]), .b(mux_out), .sum(add_out), .cout(cout));

PROD g5 (.sum(add_out), .cout(cout), .shp(shp), .ldp(ldp), .clr(clr), .p(p), .clk(clk)); 

endmodule
