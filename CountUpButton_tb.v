module CountUpButton_tb;
    reg i_rst = 0;
    reg i_countUpClicked = 0;
    wire [13:0] o_count;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    CountUpButton DUT(
        .i_rst  (i_rst  ),
        .i_countUpClicked  (i_countUpClicked  ),
        .o_count(o_count)
    );

    initial begin
        i_rst <= 1;
        #2
        i_rst <= 0;
        #2
        i_countUpClicked <= 1;
        #2
        i_countUpClicked <= 0;
        #2
        i_countUpClicked <= 1;
        #2
        i_countUpClicked <= 0;
        #3
        i_countUpClicked <= 1;
        #5
        i_countUpClicked <= 0;
        #3
        i_rst <= 1;
        #2
        i_rst <= 0;
        #2
        i_countUpClicked <= 1;
        #2
        $finish;
    end
endmodule