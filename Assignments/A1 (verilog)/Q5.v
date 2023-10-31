module JK(
    input clk,
    input rst,
    input J, K,
    output reg y
);
    reg curr_state = 0;
    always@(rst or posedge clk) begin
        if (clk) begin
            y = (J&(!curr_state)) | ((!K)&curr_state);
            curr_state = y;
        end
        if (rst) y = 0;
    end
endmodule