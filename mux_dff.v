module mux_dff (
    input clk,
    input a,
    input sel,
    output reg q
);
    wire mux_out;

    // MUX: selects between a and current q
    assign mux_out = (sel == 1'b0) ? a : q;

    // D Flip-Flop
    always @(posedge clk)
        q <= mux_out;
endmodule
