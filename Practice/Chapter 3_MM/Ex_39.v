module half_adder(s, c, a, b);
    input a, b;
    output s, c;

    assign c = a && b;
    XOR G(s, a, b);
endmodule