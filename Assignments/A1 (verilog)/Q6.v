module D(
    input rst,
    input clk,
    input d,
    output reg y
);
    always@(rst or posedge clk) begin
        if (clk) begin
            y = d;
        end
    end
endmodule

module detect_1011(
    dt, clk,
    y,
    curr_state, next_state
);
    input dt, clk;
    output reg y;
    output reg [0:2] curr_state = 3'b0;
    output reg [0:2] next_state;

    always@(clk) begin
        assign y = 0;
        if (dt == 1) begin
            if (curr_state == 3'b0) next_state = curr_state + 1;
            else if (curr_state == 3'b0 + 1) next_state = curr_state;
            else if (curr_state == 3'b0 + 2) next_state = curr_state + 1;
            else if (curr_state == 3) begin 
                next_state = curr_state + 1;
                assign y = 1;
            end
            else if (curr_state == 3'b0 + 4) next_state = 3'b1;
        end
        else if (dt == 0) begin
            if (curr_state == 3'b0) next_state = curr_state;
            else if (curr_state == 3'b0 + 1) next_state = curr_state + 1;
            else if (curr_state == 3'b0 + 2) next_state = 3'b0;
            else if (curr_state == 3'b0 + 3) next_state = curr_state - 1;
            else if (curr_state == 3'b0 + 4) next_state = 3'b0 + 2;
        end
        curr_state = next_state;
    end

endmodule