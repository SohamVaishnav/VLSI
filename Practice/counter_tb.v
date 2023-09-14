module counter_tb;
    reg clk, rst;
    wire [31:0] count;
    counter m1(.clk(clk), .rst(rst), .count(count));

    initial 
    begin
        $dumpfile("counter_out.vcd");
        $dumpvars(0, counter_tb);
        $monitor($time, "clk = %b, rst = %b, count = %b", clk, rst, count);

        #5 rst = 1'b1;
        #5 clk = 1'b0;

        #5 rst = !rst;

        #5 clk = !clk;
        #5 clk = !clk;
        #5 clk = !clk;
        #5 clk = !clk;

        #5 clk = !clk;
        #5 clk = !clk;
        #5 clk = !clk;
        #5 clk = !clk;

        $finish;

    end
        
endmodule