`include "Q4.v"

module Q4_tb;
    reg clk, rst;
    wire [3:0] count;
    wire out;

    counter m(.clk(clk), .rst(rst), .count(count), .out(out));
    parameter period = 5;

    initial
    begin
        $dumpfile("Q4_out.vcd");
        $dumpvars(0, Q4_tb);

        $monitor("out = %b, count = %b", out, count);

        #period rst = 1'b1;
        #period rst = !rst;
        
        #period clk = 1'b0;

        #period clk = !clk;
        #period clk = !clk;
        #period clk = !clk;
        #period clk = !clk;

        #period clk = !clk;
        #period clk = !clk;
        #period clk = !clk;
        #period clk = !clk;

        #period clk = !clk;
        #period clk = !clk;
        #period clk = !clk;
        #period clk = !clk;

        #5 $finish;
    end
endmodule