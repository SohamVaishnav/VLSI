module MUX_2_1(input i1, i2, s0, output y);
    wire t1, t2;

    AND G0(t1, i1, !s0);
    AND G1(t2, i2, s0);
    
    OR G3(y, t1, t2);
endmodule



module MUX_4_1(input i1, i2, i3, i4, s0, s1, 
output y);
    wire t1, t2, t3, t4;
    wire sel1, sel2, sel3, sel4;

    AND G0(sel1, !s0, !s1);
    AND G1(sel2, !s0, s1);
    AND G2(sel3, s0, !s1);
    AND G3(sel4, s0, s1);

    AND G4(t1, i1, sel1);
    AND G5(t2, i2, sel2);
    AND G6(t3, i3, sel3);
    AND G7(t4, i4, sel4);

    assign y = t1 || t2 || t3 || t4;

    // -------alternatively we can use 3 2x1 MUXes as follows:
    wire m1, m2;
    MUX_2_1 M0(i1, i3, s0, m1);
    MUX_2_1 M1(i2, i4, s0, m2);
    MUX_2_1 M2(m1, m2, s1, y);

endmodule

//the above idea can be furthered while making 8x1 or even 16x1 MUXes