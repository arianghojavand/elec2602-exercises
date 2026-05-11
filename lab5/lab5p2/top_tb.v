`timescale 1ns/1ps

module top_tb;

    reg clk;
    reg rst;
    reg w;

    wire z;

    // instantiate DUT
    top dut (
        .w(w),
        .clk(clk),
        .rst(rst),
        .z(z)
    );

    // override timer parameters for simulation
    defparam dut.timer_enable.MAX_COUNT = 10;
    defparam dut.timer_enable.N = 4;

    // clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // monitor signals
    initial begin
        $monitor(
            "TIME=%0t \t| rst=%b \t| w=%b \t| count=%d \t| enable=%b \t| current_state=%b \t| next_state=%b \t| z=%b",
            $time,
            rst,
            w,
            dut.timer_enable.count,
            dut.enable,
            dut.current_state,
            dut.next_state,
            z
        );
    end

    // waveform dump
    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    // stimulus
    initial begin

        rst = 1;
        w = 0;

        #20;
        rst = 0;

        // hold 0 long enough to progress
        #200;

        // now switch to 1s
        w = 1;

        #200;

        // mixed inputs
        w = 0;
        #100;

        w = 1;
        #100;

        $finish;

    end

endmodule