`timescale 1ns / 1ns

module rca_tb;

reg [3:0]      x,  y;
reg            cin;
wire [3:0]     sum;
wire           cout;
wire [3:0]     res;

assign res = { cout, sum};

rca u1 ( x, y, cin, cout, sum);

initial begin
x = 2; y = 4; cin = 0;
   #10 x = 3; y = 3; cin = 1;
   #10 x = 5; y = 6; cin = 1;
   #10 x = 7; y = 7; cin = 1;
   
   #10 $stop;
end

initial $monitor($time, "ns, x=%d, y=%d, cin = %d, addition result = %d", x, y, cin, res);

endmodule