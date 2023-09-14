module logic(A, B, C, D, F);
    input A, B, C, D;
    output F;
    wire t1, t2, t3, t4;

    assign t1 = ~(C && D);
    assign t2 = (~t1) ||(~B);
    assign t3 = ~(t2 && A);

    assign t4 = ~(B && (~C));
    assign F = (~t3) || (~t4);
endmodule