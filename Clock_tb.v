    module Clock_tb;
    reg i_clk = 0;
    reg i_rst = 0;
    wire o_delayClock;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    Clock DUT(
        .i_clk  (i_clk  ),
        .i_rst  (i_rst  ),
        .o_delayClock(o_delayClock)
    );

    always #1 begin
        i_clk <= ~i_clk;
    end

    initial begin
        i_rst <= 1;
        #2
        i_rst <= 0;
        #50
        $finish;
    end
endmodule