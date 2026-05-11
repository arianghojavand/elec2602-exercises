`timescale 1ns/1ps

module counter_top_tb;
    reg clk;
    reg clear;
    reg enable;
    wire [6:0] out;

    counter_top uut (
        .clk(clk),
        .clear(clear),
        .enable(enable),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin

        $dumpfile("counter_top_tb.vcd");
        $dumpvars(0, counter_top_tb);

        $monitor(
            "time=%0t \tclk=%b \tclear=%b \tcurrent_time=%d \tcurrent_count=%d \tone_sec=%b",
            $time,
            clk,
            clear,
            uut.current_time,
            uut.current_count,
            uut.one_sec
        );

        clk = 0;
        clear = 1;
        enable = 1;

        #20;
        clear = 0;
        
        #1000000;

        $finish;
    end

endmodule