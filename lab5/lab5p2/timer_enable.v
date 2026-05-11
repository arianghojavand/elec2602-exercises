module timer_enable #(parameter MAX_COUNT = 50_000_000, parameter N = 26) (clk, rst, enable);
    input wire clk, rst;
    output reg enable;

    reg [N-1:0] count;

    always @(posedge clk) begin
        if (rst) begin
            count <= 0;
            enable <= 0;
        end else if (count == MAX_COUNT - 1) begin
            count <= 0;
            enable <= 1;
        end else begin
            count <= count + 1;
            enable <= 0;
        end
    end

endmodule