`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2019 08:53:46 PM
// Design Name: 
// Module Name: mux_4to1_tb
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


module mux_4to1_tb;
    reg[3:0] d0,d1,d2,d3;
    reg[1:0] sel;
    wire [3:0] y;
    
    mux_4to1 k1(d0, d1, d2, d3, sel, y);
    
    initial begin 
            d0 = 4'b0000; d1 = 4'b0000; d2 = 4'b0000; d3 = 4'b0000; sel = 2'b00;
    #10     d0 = 4'b1010; d1 = 4'b0000; d2 = 4'b0000; d3 = 4'b0000; sel = 2'b00;
    #10     d0 = 4'b1010; d1 = 4'b0000; d2 = 4'b0000; d3 = 4'b0000; sel = 2'b01;
    #10     d0 = 4'b1010; d1 = 4'b1111; d2 = 4'b0000; d3 = 4'b0000; sel = 2'b01;
    #10     d0 = 4'b1010; d1 = 4'b0000; d2 = 4'b0000; d3 = 4'b0000; sel = 2'b10;
    #10     d0 = 4'b1010; d1 = 4'b0000; d2 = 4'b1111; d3 = 4'b0000; sel = 2'b10;
    #10     d0 = 4'b1010; d1 = 4'b0000; d2 = 4'b0000; d3 = 4'b0000; sel = 2'b11;
    #10     d0 = 4'b1010; d1 = 4'b0000; d2 = 4'b0000; d3 = 4'b1111; sel = 2'b11;
    #10     $stop;
    end 
endmodule
