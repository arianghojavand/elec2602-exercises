module counter_top(clk, clear, out, enable);
    input clk, clear, enable;
    output [6:0] out;

    wire [3:0] current_count;
    wire [25:0] current_time;

    wire one_sec, timer_reset;

    assign one_sec = (current_time == 26'd49_999_999);
    assign timer_reset = (current_time == 26'd50_000_000);

    counter #(26) timer_counter (
        .clk(clk),
        .clear(clear | timer_reset),
        .enable(1'b1),
        .Q(current_time)
    );

    counter #(4) digit_counter (
        .clk(clk),
        .clear(clear | (one_sec & (current_count == 4'd9))),
        .enable(one_sec & enable),
        .Q(current_count)
    );

    decoder_7seg decoder (
        .code(current_count),
        .decoded_output(out)
    );

endmodule