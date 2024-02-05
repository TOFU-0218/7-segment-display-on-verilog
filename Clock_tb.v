    module Clock_tb;
    reg i_clk = 0;
    wire o_delayClock;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    Clock DUT(
        .i_clk  (i_clk  ),
        .o_delayClock(o_delayClock)
    );

    always #1 begin
        i_clk <= ~i_clk;
    end

    initial begin
        #50
        $finish;
    end
endmodule