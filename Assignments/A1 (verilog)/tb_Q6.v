`include "Q6.v"

module Q6_tb;
    reg dt, clk;
    wire y;
    wire [0:2] curr_state; wire [0:2] next_state;

    detect_1011 m(.dt(dt), .clk(clk), .y(y), .curr_state(curr_state), .next_state(next_state));

    initial 
    begin
        $dumpfile("Q6_out.vcd");
        $dumpvars(0, Q6_tb);
        $monitor("dt = %b ", dt, "y = %b", y);

        #5 dt = 1;
        clk = 1;
        #5 dt = 0;
        clk = !clk;
        #5 dt = 1;
        clk = !clk;
        #5 dt = 1;
        clk = !clk;
        #5 dt = 1;
        clk = !clk;
        #5 dt = 0;
        clk = !clk;
        #5 dt = 1;
        clk = !clk;
        #5 dt = 0;
        clk = !clk;
        #5 dt = 1;
        clk = !clk;
        #5 dt = 1;
        clk = !clk;
        #5 dt = 0;
        clk = !clk;

        #5 $finish;
    end
endmodule