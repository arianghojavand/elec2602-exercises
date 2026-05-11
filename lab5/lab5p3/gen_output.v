module gen_output(count, target, out);
    input [3:0] count, target;
    output out;

    assign out = count >= target;

endmodule