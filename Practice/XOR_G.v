module Xor_G(Y, A, B);
    input A, B;
    output Y;
    assign Y = ((~A)&B) | (A&(~B));

    //or can also be written using custom made gates

    wire t1, t2;
    And_G G1(t1, ~A, B); 
    And_G G2(t2, A, ~B);
    Or_G G3(Y, t1, t2);
endmodule