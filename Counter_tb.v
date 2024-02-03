module Counter_tb;
    reg i_clk = 0;
    wire [1:0] o_count;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    Counter DUT(
        .i_clk  (i_clk  ),
        .o_count(o_count)
    );
    
    always #1 begin
        i_clk <= ~i_clk;
    end
    
    initial begin
        #50
        $finish;
    end
endmodule