`timescale 1ns / 1ns
module mux2to1_tb;

reg       d1, d0, s;
wire     y;

mux2to1   u1 (d1, d0, s, y);




initial begin
          d1 = 0;  d0 = 0;  s = 0;
  #10  d1 = 0;  d0 = 0;  s = 1;
  #10  d1 = 0;  d0 = 1;  s = 0;
  #10  d1 = 0;  d0 = 1;  s = 1;
  #10  d1 = 1;  d0 = 0;  s = 0;
  #10  d1 = 1;  d0 = 0;  s = 1;
  #10  d1 = 1;  d0 = 1;  s = 0;
  #10  d1 = 1;  d0 = 1;  s = 1;
  #10 $stop;
end

initial $monitor($time, "ns, d1=%b, d0=%b, s = %b,  y=%b", d1, d0, s, y);

endmodule