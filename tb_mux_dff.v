module tb_mux_dff;
    reg clk_tb, a_tb, sel_tb;
    wire q_tb;

    // Instantiate load-enabled D flip-flop
    load_dff uut (
        .clk(clk_tb),
        .a(a_tb),
        .sel(sel_tb),
        .q(q_tb)
    );

    // Clock generation
    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb; // 10 time units clock period
    end

    initial begin
        $dumpfile("load_dff.vcd");
        $dumpvars(0, tb_load_dff);

        a_tb = 1; sel_tb = 0; #10;  // Load 1
        a_tb = 0; sel_tb = 1; #10;  // Hold previous (1)
        a_tb = 0; sel_tb = 0; #10;  // Load 0
        a_tb = 1; sel_tb = 1; #10;  // Hold previous (0)

        $finish;
    end
endmodule
