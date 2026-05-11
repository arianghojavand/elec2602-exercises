module toggle_ff(clk, clear, T, Q);
    input clk;
    input clear;
    input T;
    output reg Q;

    always @(posedge clk or posedge clear) begin
        if (clear) begin
            Q <= 1'b0;
        end else begin
            Q <= Q ^ T;
        end 
        
    end

endmodule