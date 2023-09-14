module One_bit_comp(A, B, Y1, Y2, Y3);
    input A, B;
    output Y1, Y2, Y3;

    // consider Y1 = A<B, Y2 = A=B, Y3 = A>B

    assign Y1 = !A && B;
    assign Y3 = A && !B;
    assign Y2 = (!A && !B) || (A && B);
endmodule
