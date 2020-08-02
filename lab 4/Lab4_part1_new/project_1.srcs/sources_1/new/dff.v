`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2019 09:07:34 PM
// Design Name: 
// Module Name: dff
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


module dff(CLK,CLR,CE,D,Q);
    input [3:0] D;
    input  CE;
    input CLK,CLR;
    output reg [3:0] Q;
    
    always @(posedge CLK or CLR)
    begin 
        if(CLR)
            Q <= 0;
        else if (CE) 
            Q <= D;     
    end 
    
endmodule
