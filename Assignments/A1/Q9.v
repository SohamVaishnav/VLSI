module Q9(input d, s0, s1, s2, output y);
    //s0 is A, s1 is B, and s2 is C
    wire t1, t2, t3, t4, t5, t6, t7, t8;
    wire sel1, sel2, sel3, sel4, sel5, sel6, sel7, sel8;

    and (sel1, !s0, !s1, !s2);
    and (sel2, !s0, !s1, s2);
    and (sel3, !s0, s1, !s2);
    and (sel4, !s0, s1, s2);
    and (sel5, s0, !s1, !s2);
    and (sel6, s0, !s1, s2);
    and (sel7, s0, s1, !s2);
    and (sel8, s0, s1, s2);

    and (t1, sel1, 1);
    and (t2, sel2, d);
    and (t3, sel3, 1);
    and (t4, sel4, d);
    and (t5, sel5, 1);
    and (t6, sel6, 0);
    and (t7, sel7, d);
    and (t8, sel8, 1);

    or (y, t1, t2, t3, t4, t5, t6, t7, t8);

endmodule