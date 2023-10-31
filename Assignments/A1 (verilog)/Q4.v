module counter(clk, rst, count, out);
    input clk, rst;
    output reg [0:0] out = 0;
    output reg [3:0] count = 4'b0;
    reg [0:0] dum = 1'b1;

    always @(rst or posedge clk)
    begin
        if (dum == 0) begin
            count = 4'b0;
            out = 0;
            dum = 1;
        end
        count = count + 3;
        if (count < 10) begin
            out = 0;
        end
        else if ( count >= 10) begin
            out = 1;
            if (count == 15) begin 
                dum = 0;
            end
        end
    end

endmodule