module counter #(parameter N = 16) (clk, clear, enable, Q);
    input clk;
    input clear;
    input enable;

    output[N - 1:0] Q;
    wire [N - 1:0] T;

    assign T[0] = enable;

    genvar i;

    generate
        for (i = 1; i < N; i = i + 1) begin : toggle_logic
            assign T[i] = enable & (&Q[i-1:0]);
        end
    endgenerate


    generate
        for (i = 0; i < N; i = i + 1) begin: gen_ff
            toggle_ff ff(clk, clear, T[i], Q[i]);
        end
    endgenerate


endmodule
