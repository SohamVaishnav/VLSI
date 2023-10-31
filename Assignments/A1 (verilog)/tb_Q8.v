`include "Q8.v"

module Q8_tb;
    reg [0:1] A, B;
    wire GT, EQ;

    parameter period = 5;

    Q8 m(.A(A), .B(B), .EQ(EQ), .GT(GT));

    initial begin
        $dumpfile("Q8_out.vcd");
        $dumpvars(0, Q8_tb);
        $monitor("A = %b, B = %b, GT = %b, EQ = %b", A, B, GT, EQ);

        #period A = 0; B = 0;
        #period A = 0; B = 1;
        #period A = 0; B = 2;
        #period A = 0; B = 3;
        #period A = 1; B = 0;
        #period A = 1; B = 1;
        #period A = 1; B = 2;
        #period A = 1; B = 3;
        #period A = 2; B = 0;
        #period A = 2; B = 1;
        #period A = 2; B = 2;
        #period A = 2; B = 3;
        #period A = 3; B = 0;
        #period A = 3; B = 1;
        #period A = 3; B = 2;
        #period A = 3; B = 3;
        #period $finish;
    end

endmodule