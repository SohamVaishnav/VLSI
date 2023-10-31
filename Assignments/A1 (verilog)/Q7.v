module Moore_Mach(
    input X, clk,
    output reg Y
);
    reg [0:1] curr_state = 2'b0;
    reg [0:1] next_state;

    always@(clk) begin
        if (X == 1) begin
            if (curr_state == 2'b0) begin
                Y = 0;
                next_state = curr_state + 1;
            end
            else if (curr_state == 2'b0 + 1) begin
                Y = 1;
            end
            else if (curr_state == 2'b0 + 2) begin
                Y = 0;
            end
        end
        else begin
            if (curr_state == 2'b0) begin
                Y = 0;
            end
            else if (curr_state == 2'b0 + 1) begin
                Y = 1;
                next_state = curr_state + 1;
            end
            else if (curr_state == 2'b0 + 2) begin
                Y = 0;
            end
        end
        curr_state = next_state;
    end
endmodule