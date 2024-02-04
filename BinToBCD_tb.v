module BinToBCD_tb;
    reg i_clk = 0;
    reg i_rst = 0;
    reg [13:0] i_count = 14'b0;
    wire [15:0] o_BCD;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    BinToBCD DUT(
        .i_clk  (i_clk  ),
        .i_rst  (i_rst  ),
        .i_count(i_count),
        .o_BCD(o_BCD)
    );

    always #1 begin
        i_clk <= ~i_clk;
    end

    initial begin
        i_rst <= 1;
        #2
        i_rst <= 0;
        #30
        i_count <= 14'd1;
        #30
        i_count <= 14'd34;
        #30
        i_count <= 14'd529;
        #30
        i_count <= 14'd1024;
        #30
        i_count <= 14'd2222;
        #30
        i_count <= 14'd0;
        #30
        $finish;
    end
endmodule

        