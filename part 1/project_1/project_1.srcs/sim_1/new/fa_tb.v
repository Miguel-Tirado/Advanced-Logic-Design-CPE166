`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2019 01:53:55 PM
// Design Name: 
// Module Name: fa_tb
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


module fa_tb;

reg       a,  b, cin;
wire     cout, sum;


fa   u1 ( a, b, cin, cout, sum );




initial begin
         {a, b, cin} = 3'b000;
  #10 {a, b, cin} = 3'b001;
  #10 {a, b, cin} = 3'b01_0;
  #10 {a, b, cin} = 3'b011;
  #10 {a, b, cin} = 4;
  #10 {a, b, cin} = 5;
  #10 {a, b, cin} = 6;
  #10 {a, b, cin} = 7;
  #10 $stop;
end

initial $monitor($time, "ns, a=%b, b=%b, cin = %b, cout=%b, sum=%b", a, b, cin, cout, sum);

endmodule
