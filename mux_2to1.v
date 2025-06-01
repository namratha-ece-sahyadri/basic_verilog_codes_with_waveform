module mux_2to1 (
    input a,
    input b,
    input sel,
    output y
);
    assign y = (sel == 1'b0) ? a : b;
endmodule
