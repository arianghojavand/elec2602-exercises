module top(w, clk, rst, z);
    input wire w, clk, rst;
    output wire z;

    wire enable;

    wire [3:0] current_state;
    wire [3:0] next_state;

    my_reg #(4) state_reg(
        .current_state(current_state),
        .next_state(next_state),
        .clk(clk),
        .rst(rst),
        .enable(enable)
    );


    timer_enable #(50_000_000, 26) timer_enable(
        .clk(clk),
        .rst(rst),
        .enable(enable)
    );
    
    next_state ns(
        .current_state(current_state),
        .w(w),
        .next_state(next_state)
    );

    gen_output out(
        .in_state(current_state),
        .out(z)
    );

endmodule