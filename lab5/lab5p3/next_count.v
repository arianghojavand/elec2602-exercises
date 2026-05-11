module next_count_logic(count, increment, next_count);

    input wire [3:0] count;
    input wire increment;

    output reg [3:0] next_count;

    always @(*) begin
        if (increment)
            next_count = count + 1'b1;
        else
            next_count = 4'd1;
    end

endmodule