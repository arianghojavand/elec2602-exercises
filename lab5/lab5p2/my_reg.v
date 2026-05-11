module my_reg #(parameter N = 4) (current_state, next_state, clk, rst, enable);
    input wire clk, rst, enable;
    input wire [N-1:0] next_state;
    output reg [N-1:0] current_state;

    always @(posedge clk) begin
        if (rst) begin
            current_state <= {N{1'b0}};
        end else if (enable) begin
            current_state <= next_state;
        end

    end

endmodule