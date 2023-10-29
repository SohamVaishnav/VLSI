module two_four_Decoder(
    input [1:0] Sel,
    output [3:0] Y
);
    and (Y[0], ~Sel[1], ~Sel[0]);
    and (Y[1], ~Sel[1], Sel[0]);
    and (Y[2], Sel[1], ~Sel[0]);
    and (Y[3], Sel[1], Sel[0]);
endmodule


module full_adder(
    input A, B, C,
    output [1:0] Y
);
    wire w1, w2, c;
    and (c, A, B);
    xor (w1, A, B);

    xor (Y[0], w1, C);

    and (w2, C, w1);
    or (Y[1], c, w2);
endmodule;

module four_bit_Adder_Subtr(
    input En,
    input C0,
    input [3:0] A, B,
    output [4:0] Y
);
    wire [3:0] b;
    xor (b[0], C0, B[0]);
    xor (b[1], C0, B[1]);
    xor (b[2], C0, B[2]);
    xor (b[3], C0, B[3]);

    wire [1:0] y1, y2, y3, y4;
    full_adder f1(A[0], b[0], C0, y1);
    and (Y[0], En, y1[0]);
    full_adder f2(A[1], b[1], y1[1], y2);
    and (Y[1], En, y2[0]);
    full_adder f3(A[2], b[2], y2[1], y3);
    and (Y[2], En, y3[0]);
    full_adder f4(A[3], b[3], y3[1], y4);
    and (Y[3], En, y4[0]);
    and (Y[4], En, y4[1]);
endmodule

module four_bit_Comp(
    input En,
    input [3:0] A, B,
    output Eq, Gt, Lt
);
    wire w1, w2, w3, w4;
    xnor (w1, A[0], B[0]);
    xnor (w2, A[1], B[1]);
    xnor (w3, A[2], B[2]);
    xnor (w4, A[3], B[3]);
    and (Eq, En, w1, w2, w3, w4);

    wire w5, w6, w7, w8, w13;
    and (w5, A[3], ~B[3]);
    and (w6, w4, A[2], ~B[2]);
    and (w7, w3, w4, A[1], ~B[1]);
    and (w8, w2, w3, w4, A[0], ~B[0]);
    or (w13, w5, w6, w7, w8);
    and (Gt, En, w13);

    wire w9, w10, w11, w12, w14;
    and (w9, ~A[3], B[3]);
    and (w10, w4, ~A[2], B[2]);
    and (w11, w3, w4, ~A[1], B[1]);
    and (w12, w2, w3, w4, ~A[0], B[0]);
    or (w14, w9, w10, w11, w12);
    and (Lt, En, w14);
endmodule

module four_bit_ANDer(
    input En,
    input [3:0] A, B,
    output [3:0] Y
);
    and (Y[0], En, A[0], B[0]);
    and (Y[1], En, A[1], B[1]);
    and (Y[2], En, A[2], B[2]);
    and (Y[3], En, A[3], B[3]);
endmodule

module four_bit_ALU(
    input [3:0] A, B,
    input [1:0] Sel,
    output [4:0] Y_addSub,
    // output [4:0] Y_sub,
    output [3:0] Y_and,
    output Eq, Gt, Lt
);
    wire [3:0] y;
    
    two_four_Decoder D(Sel, y);

    four_bit_Adder_Subtr f1(y[0], !y[0]&y[1], A, B, Y_addSub);
    // four_bit_Adder_Subtr f2(y[1], y[1], A, B, Y_sub);
    four_bit_Comp f3(y[2], A, B, Eq, Gt, Lt);
    four_bit_ANDer f4(y[3], A, B, Y_and);
endmodule