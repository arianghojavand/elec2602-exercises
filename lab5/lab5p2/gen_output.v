module gen_output(in_state, out);
    input [3:0] in_state;
    output out;

    `include "params.vh"

    assign out = (in_state == E) || (in_state == I);

endmodule