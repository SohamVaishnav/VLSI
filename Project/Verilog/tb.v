module tb;
    reg [3:0] A, B;
    reg [1:0] Sel;
    wire [4:0] Y_add;
    wire [4:0] Y_sub;
    wire [3:0] Y_and;
    wire Eq, Gt, Lt;

    four_bit_ALU ALU(A, B, Sel, Y_add, Y_sub, Y_and, Eq, Gt, Lt);

    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, tb);
        $monitor("A = %b", A, " B = %b", B, " Sel = %b", Sel, " Y_add = %b", Y_add, 
        " Y_sub = %b", Y_sub, " Y_and = %b", Y_and, 
        " Eq = %b", Eq, " Gt = %b", Gt, " Lt = %b", Lt);

        #5 A = 4'b1111; B = 4'b1111; Sel = 2'b00;
        #5 A = 4'b1111; B = 4'b1111; Sel = 2'b01;
        #5 A = 4'b1111; B = 4'b1111; Sel = 2'b10;
        #5 A = 4'b1111; B = 4'b1111; Sel = 2'b11;

        #10 $finish;
    end
endmodule