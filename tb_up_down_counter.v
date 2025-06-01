module tb_up_down_counter;
    reg clk_tb, rst_tb, up_down_tb;
    wire [3:0] count_tb;

    up_down_counter uut (
        .clk(clk_tb),
        .rst(rst_tb),
        .up_down(up_down_tb),
        .count(count_tb)
    );

    // Generate Clock
    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb; // Clock period = 10 units
    end

    initial begin
        $dumpfile("up_down_counter.vcd");
        $dumpvars(0, tb_up_down_counter);

        // Reset
        rst_tb = 1; up_down_tb = 1; #10;
        rst_tb = 0;

        // Count up
        up_down_tb = 1; #50;

        // Count down
        up_down_tb = 0; #50;

        $finish;
    end
endmodule
