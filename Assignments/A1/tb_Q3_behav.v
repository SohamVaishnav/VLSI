`include "Q3_behav.v"

module Q3_tb;
    reg A, B, C;
    wire F1, F2;

    logic_behav m(.A(A), .B(B), .C(C), .F1(F1), .F2(F2));

    initial begin
        $dumpfile("Q3_out.vcd");
        $dumpvars(0, Q3_tb);
        $monitor("A = %b ", A, "B = %b ", B, "C = %b ", C,
        "F1 = %b ", F1, "F2 = %b", F2);

        #5 A=0; B=0; C=0;
        #5 A=0; B=0; C=1;
        #5 A=0; B=1; C=0;
        #5 A=0; B=1; C=1;
        #5 A=1; B=0; C=0;
        #5 A=1; B=0; C=1;
        #5 A=1; B=1; C=0;
        #5 A=1; B=1; C=1;

        #5 $finish;
    end
endmodule