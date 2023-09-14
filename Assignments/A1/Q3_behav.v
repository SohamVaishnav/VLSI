module logic_behav(
    input A, B, C,
    output reg F1, F2
);
    always@(*) begin
        if (C == 1) begin
            if (A == 0 && B == 0) F2 = 0;
            else F2 = 1;
        end
        else if (C == 0) begin
            if (A == B) F2 = A;
            else F2 = 0;
        end
        if (F2 == 0) begin
            if (A == 0 && B == 0 && C == 0) F1 = 0;
            else F1 = 1;
        end
        else if (F2 == 1) begin
            if (A == B && B == C) F1 = A;
            else F1 = 0;
        end
    end
endmodule