module half_adder(input a, b, output s, c);
    assign s = a ^ b;
    assign c = a & b;
endmodule

module tb_half_add;
    reg a_tb, b_tb;
    wire s_tb, c_tb;

    // Correct instantiation syntax: use parentheses ()
    half_adder u0 (.a(a_tb), .b(b_tb), .s(s_tb), .c(c_tb));

    initial begin
        // Dump file for waveform viewing
        $dumpfile("counter.vcd");
        $dumpvars(0, tb_half_add);

        // Stimulus
        a_tb = 0; b_tb = 0;
        #10;
        a_tb = 0; b_tb = 1;
        #10;
        a_tb = 1; b_tb = 0;
        #10;
        a_tb = 1; b_tb = 1;
        #10;

        // End simulation
        $finish;
    end
endmodule
