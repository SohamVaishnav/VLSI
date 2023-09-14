module counter(clk, rst, count);

    //behavorial code without using gates....

    input clk, rst;
    output reg [31:0] count = 32'b0; 
    always @(rst or posedge clk) 
    begin
        if (clk) begin
            count = count + 1;
        end
        if (rst) begin
            count = 32'b0;
        end
    end
endmodule