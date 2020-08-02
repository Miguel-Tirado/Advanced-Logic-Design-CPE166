`timescale 1ns / 1ns

module rca_tb;

reg [3:0]      a,  b;
reg            cin;
wire [3:0]     sum;
wire           cout;
wire [3:0]     res;

assign res = { cout, sum};

rca u1 ( a, b, cin, cout, sum);

initial begin
a = 2; b = 4; cin = 0;
   #10 a = 3; b = 3; cin = 1;
   #10 a = 5; b = 6; cin = 1;
   #10 a = 7; b = 7; cin = 1;
   
   #10 $stop;
end

initial $monitor($time, "ns, a=%d, b=%d, cin = %d, addition result = %d", a, b, cin, res);

endmodule