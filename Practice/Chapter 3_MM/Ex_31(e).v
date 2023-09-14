module logic (A, B, C, D, E, F);
    input A, B, C, D, E;
    output F;
    wire t1, t2;

    assign t1 = ~(A || B);
    assign t2 = ~(C || D);
    assign F = E && (~t1) && (~t2);
endmodule