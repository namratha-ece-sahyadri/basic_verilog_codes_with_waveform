module tb_mux_2to1;
    reg a_tb, b_tb, sel_tb;
    wire y_tb;

    // Instantiate the MUX
    mux_2to1 uut (
        .a(a_tb),
        .b(b_tb),
        .sel(sel_tb),
        .y(y_tb)
    );

    initial begin
        $dumpfile("mux2to1.vcd");
        $dumpvars(0, tb_mux_2to1);

        // Test all combinations
        a_tb = 0; b_tb = 0; sel_tb = 0; #10;
        a_tb = 0; b_tb = 1; sel_tb = 0; #10;
        a_tb = 1; b_tb = 0; sel_tb = 1; #10;
        a_tb = 1; b_tb = 1; sel_tb = 1; #10;

        $finish;
    end
endmodule
