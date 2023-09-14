`include "Q5.v"

module Q5_tb;
    reg clk, rst, J, K;
    wire y;

    JK ff(.clk(clk), .rst(rst), .J(J), .K(K), .y(y));

    initial 
    begin
    $dumpfile("Q5_out.vcd");
    $dumpvars(0, Q5_tb);
    $monitor("J = %b ", J, "K = %b ", K, "Q = %b", y);

    #5 rst = 1;
    #5 rst = 0;

    #5 clk = 1;
    J = 1;
    K = 0;

    #5 clk = 0;

    #5 clk = 1; 
    J = 1;
    K = 1;

    #5 clk = 0;

    #5 clk = 1;
    J = 1;
    K = 1;

    #5 clk = 0;

    #5 clk = 1;
    J = 0;
    K = 1;

    #5 clk = 0;

    #5 clk = 1;
    J = 0;
    K = 0;

    #5 $finish;

    end
endmodule