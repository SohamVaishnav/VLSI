module Q8(A, B, GT, EQ);
    input [0:1] A, B;
    output GT, EQ;
    wire x0;
    // consider EQ = A=B, GT = A>B
    assign x0 = (A[0] && B[0]) || (!A[0] && !B[0]);

    assign EQ = ((!A[1] && !B[1]) || (A[1] && B[1])) && ((!A[0] && !B[0]) || (A[0] && B[0])); //1 if true
    assign GT = (A[0] && !B[0]) || x0 && (A[1] && !B[1]); //1 if true and 0 if false
endmodule