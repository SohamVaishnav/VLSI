module logic_struct(
    input A, B, C,
    output F1, F2
);
    wire t1, t2, t3, t4, t5, t6, t7, t8;

    and (t1, A, B);
    or (t2, A, B);
    and (t3, t2, C);
    or (t4, t2, C);
    and (t5, t1, C);
    or (F2, t3, t1);
    and (t7, !F2, t4);
    or (F1, t5, t7);
endmodule