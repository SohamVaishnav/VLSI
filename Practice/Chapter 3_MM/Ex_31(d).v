module logic(A, B, C, D, F);
    input A, B, C, D;
    output F;
    wire t1, t2, t3, t4;

    assign t1 = ~(A && (~B));
    assign t2 = ~((~A) && (B));
    assign t3 = (~t1) || (~t2);
    assign t4 = C || (~D);

    assign F = (t3 && t4);
endmodule