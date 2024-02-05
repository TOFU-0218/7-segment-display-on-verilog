module TOP_tb;
    reg i_clk = 0;
    reg i_rst = 1;
    reg i_countUpClicked = 1;
    wire [7:0] o_LED;
    wire [3:0] o_digitSelect;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    TOP DUT(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_countUpClicked(i_countUpClicked),
        .o_LED(o_LED),
        .o_digitSelect(o_digitSelect)
    );

    always #1 begin
        i_clk <= ~i_clk;
    end

    initial begin
        #20
        i_rst <= 0;
        #20
        i_rst <= 1;
        #20
        i_countUpClicked <= 0;
        #20
        i_countUpClicked <= 1;
        #20
        i_countUpClicked <= 0;
        #30
        i_countUpClicked <= 1;
        #20
        i_countUpClicked <= 0;
        #20
        i_countUpClicked <= 1;
        #20
        i_countUpClicked <= 0;
        #20
        i_rst <= 1;
        #20
        i_rst <= 0;
        #20
        i_countUpClicked <= 1;
        #20
        $finish;
    end
endmodule