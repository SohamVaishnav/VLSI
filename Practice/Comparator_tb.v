module comp_tb;
    reg A, B;
    wire Y1, Y2, Y3;
    One_bit_comp m(.A(A), .B(B), .Y1(Y1), .Y2(Y2), .Y3(Y3));

    initial
    begin
        $dumpfile("comp.vcd");
        $dumpvars(0, comp_tb);
        $monitor("A = %b, B = %b, Y1 = %b, Y2 = %b, Y3 = %b", A, B, Y1, Y2, Y3);

        #5 A=1'b1;
        #5 B=1'b0;

        #5 A=1'b0;
        #5 B=1'b1;

        #5 A=1'b1;
        #5 B=1'b1;

        #5 A=1'b0;
        #5 B=1'b0;

        $finish;
    end
endmodule