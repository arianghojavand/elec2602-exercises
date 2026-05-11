module next_state(current_state, w, next_state);
    input wire [3:0] current_state;
    input wire w;
    output reg [3:0] next_state;

    `include "params.vh"

    wire [4:0] temp;
    assign temp = {current_state, w};

    always @(*) begin
        case (temp)
            {A, 1'b0}: next_state = B;
            {A, 1'b1}: next_state = F;

            {B, 1'b0}: next_state = C;
            {B, 1'b1}: next_state = F;

            {C, 1'b0}: next_state = D;
            {C, 1'b1}: next_state = F;

            {D, 1'b0}: next_state = E;
            {D, 1'b1}: next_state = F;

            {E, 1'b0}: next_state = E;
            {E, 1'b1}: next_state = F;

            {F, 1'b0}: next_state = B;
            {F, 1'b1}: next_state = G;

            {G, 1'b0}: next_state = B;
            {G, 1'b1}: next_state = H;

            {H, 1'b0}: next_state = B;
            {H, 1'b1}: next_state = I;

            {I, 1'b0}: next_state = B;
            {I, 1'b1}: next_state = I;

            default: next_state = A;

        endcase
    end

endmodule