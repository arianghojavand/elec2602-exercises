module top(CLOCK_50, KEY, SW, HEX0, LEDR);

    input wire CLOCK_50;
    input wire [9:0] SW;
    input wire [3:0] KEY;

    output wire [6:0] HEX0;
    output wire [9:0] LEDR;

    wire clk = CLOCK_50;
    wire rst = ~KEY[0];
    wire save_signal = ~KEY[3];

    wire w = SW[1];
    wire enable = SW[2];
    wire [3:0] user_input = SW[9:6];

    wire [3:0] current_state;
    wire [3:0] next_state_wire;

    wire [3:0] count;
    wire [3:0] next_count;

    wire [3:0] target;
    wire increment;
    wire z;

    // FSM state register
    my_reg #(4) state_reg (
        .current_state(current_state),
        .next_state(next_state_wire),
        .clk(clk),
        .rst(rst),
        .enable(enable)
    );

    // stores SW[9:6] when KEY3 is pressed
    my_reg #(4) target_reg (
        .current_state(target),
        .next_state(user_input),
        .clk(clk),
        .rst(rst),
        .enable(save_signal)
    );

    // stores current consecutive run length
    my_reg #(4) count_reg (
        .current_state(count),
        .next_state(next_count),
        .clk(clk),
        .rst(rst),
        .enable(enable)
    );

    // FSM control logic
    next_state ns (
        .current_state(current_state),
        .w(w),
        .next_state(next_state_wire),
        .increment(increment)
    );

    // counter next-value logic
    next_count count_logic (
        .count(count),
        .increment(increment),
        .next_count(next_count)
    );

    // output z = count >= target
    gen_output output_logic (
        .count(count),
        .target(target),
        .out(z)
    );

    // show current count on HEX0
    decoder_7seg decoder (
        .code(count),
        .decoded_output(HEX0)
    );

    // light all red LEDs when detected
    assign LEDR = z ? 10'b1111111111 : 10'b0000000000;

endmodule