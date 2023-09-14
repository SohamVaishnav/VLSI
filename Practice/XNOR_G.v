module Xnor_G(Y, A, B);
    input A, B;
    output Y, C;
    
    Xor_G G(C, A, B);
    assign Y = ~C;
endmodule