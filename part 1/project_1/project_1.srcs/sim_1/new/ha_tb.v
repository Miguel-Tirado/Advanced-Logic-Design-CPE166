`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2019 01:45:16 PM
// Design Name: 
// Module Name: ha_tb
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


`timescale 1ns / 1ns
module ha_tb;

reg       a,  b;
wire     cout, sum;


ha   u1 ( a, b, cout, sum );




initial begin
         {a, b} = 2'b00;
  #10 {a, b} = 2'b01;
  #10 {a, b} = 2'b10;
  #10 {a, b} = 2'b11;
  #10 $stop;
end

initial $monitor($time, "ns, a=%b, b=%b, cout=%b, sum=%b", a, b, cout, sum);

endmodule