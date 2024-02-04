module DigitSelect_tb;
    reg i_clk = 0;
    reg i_rst = 0;
    wire [1:0] o_ctrl;
    wire [3:0] o_digitSelect;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    DigitSelect DUT(
        .i_clk  (i_clk  ),
        .i_rst  (i_rst  ),
        .o_ctrl(o_ctrl),
        .o_digitSelect(o_digitSelect)
    );
    
    always #1 begin
        i_clk <= ~i_clk;
    end
    
    initial begin
        i_rst <= 1;
        #4
        i_rst <= 0;
        #50
        i_rst <= 1;
        #4
        i_rst <= 0;
        #50
        $finish;
    end
endmodule