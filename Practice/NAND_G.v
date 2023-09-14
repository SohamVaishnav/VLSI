module Nand_G(Y, A, B);
    input A, B;
    output Y, C;
    And_G G(C, A, B);
    assign Y = ~C;
endmodule