module tb_mux_4to1;
    reg [3:0] in_tb;       // Testbench inputs
    reg [1:0] sel_tb;
    wire out_tb;

    // Instantiate the MUX
    mux_4to1 uut (
        .in(in_tb),
        .sel(sel_tb),
        .out(out_tb)
    );

    initial begin
        $dumpfile("mux4to1.vcd");
        $dumpvars(0, tb_mux_4to1);

        // Set inputs
        in_tb = 4'b1010;  // in[3]=1, in[2]=0, in[1]=1, in[0]=0

        sel_tb = 2'b00; #10;  // Expect out_tb = in[0] = 0
        sel_tb = 2'b01; #10;  // Expect out_tb = in[1] = 1
        sel_tb = 2'b10; #10;  // Expect out_tb = in[2] = 0
        sel_tb = 2'b11; #10;  // Expect out_tb = in[3] = 1

        $finish;
    end
endmodule
