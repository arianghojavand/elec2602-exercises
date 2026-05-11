module next_state(current_state, w, next_state, increment);

    input wire [3:0] current_state;
    input wire w;

    output reg [3:0] next_state;
    output reg increment;

    `include "params.vh"

    always @(*) begin
        increment = 1'b0;

        case ({current_state, w})

            {A, 1'b0}: begin
                next_state = B;
                increment = 1'b0;
            end

            {A, 1'b1}: begin
                next_state = F;
                increment = 1'b0;
            end

            {B, 1'b0}: begin
                next_state = B;
                increment = 1'b1;
            end

            {B, 1'b1}: begin
                next_state = F;
                increment = 1'b0;
            end

            {F, 1'b0}: begin
                next_state = B;
                increment = 1'b0;
            end

            {F, 1'b1}: begin
                next_state = F;
                increment = 1'b1;
            end

            default: begin
                next_state = A;
                increment = 1'b0;
            end

        endcase
    end

endmodule