module DeMUX_1_2(input i1, s0, output y1, y2);
    AND G0(y1, !s0, i1);
    AND G1(y2, s0, i1);
endmodule

module DeMUX_1_4(input i1, s0, s1, output y1, y2, y3, y4);
    
endmodule