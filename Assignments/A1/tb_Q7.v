`include "Q7.v"

module Q7_tb;
    reg X, clk;
    wire Y;

    Moore_Mach m(.X(X), .clk(clk), .Y(Y));

    initial begin
        $dumpfile("Q7_out.vcd");
        $dumpvars(0, Q7_tb);
        $monitor("X = %b and ", X, "Y = %b", Y);

        #5 X = 1;
        clk = 1;
        #5 X = 1;
        clk = !clk;
        #5 X = 0;
        clk = !clk;
        #5 X = 0;
        clk = !clk;
        #5 X = 1;
        clk = !clk;
        #5 X = 0;
        clk = !clk;

        #5 $finish;
    end
endmodule