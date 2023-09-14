// `include "Q9.v"

module Q9_tb;
    reg d, s0, s1, s2;
    wire y;

    Q9 m(d, s0, s1, s2, y);
    initial begin
        $dumpfile("Q9_out.vcd");
        $dumpvars(0, Q9_tb);
        $monitor("A= %b, B = %b, C = %b, D = %b, Y = %b", s0, s1, s2, d, y);

        #5 s0=0; s1=0; s2=0; d=0;
        #5 s0=0; s1=0; s2=0; d=1;
        #5 s0=0; s1=0; s2=1; d=0;
        #5 s0=0; s1=0; s2=1; d=1;
        #5 s0=0; s1=1; s2=0; d=0;
        #5 s0=0; s1=1; s2=0; d=1;
        #5 s0=0; s1=1; s2=1; d=0;
        #5 s0=0; s1=1; s2=1; d=1;
        #5 s0=1; s1=0; s2=0; d=0;
        #5 s0=1; s1=0; s2=0; d=1;
        #5 s0=1; s1=0; s2=1; d=0;
        #5 s0=1; s1=0; s2=1; d=1;
        #5 s0=1; s1=1; s2=0; d=0;
        #5 s0=1; s1=1; s2=0; d=1;
        #5 s0=1; s1=1; s2=1; d=0;
        #5 s0=1; s1=1; s2=1; d=1;
        #5 $finish;
    end
endmodule