module MUX_tb;
    reg [7:0] i_data_0 = 8'b00000000;
    reg [7:0] i_data_1 = 8'b00000001;
    reg [7:0] i_data_2 = 8'b00000010;
    reg [7:0] i_data_3 = 8'b00000011;
    reg i_clk = 0;
    reg [1:0] i_ctrl = 2'b00;
    reg i_rst = 0;
    wire [7:0] o_data;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    MUX DUT(
        .i_data_0  (i_data_0  ),
        .i_data_1  (i_data_1  ),
        .i_data_2  (i_data_2  ),
        .i_data_3  (i_data_3  ),
        .i_clk  (i_clk  ),
        .i_rst  (i_rst  ),
        .i_ctrl(i_ctrl),
        .o_data(o_data)
    );

    always #1 begin
        i_clk <= ~i_clk;
    end

    initial begin
        i_rst <= 1;
        #4
        i_data_0 <= 8'd1;
        i_data_1 <= 8'd2;
        i_data_2 <= 8'd3;
        i_data_3 <= 8'd4;
        #2
        i_rst <= 0;
        #2
        i_ctrl <= 2'b00;
        #2
        i_ctrl <= 2'b01;
        #2
        i_ctrl <= 2'b10;
        #2
        i_ctrl <= 2'b11;
        #2
        $finish;
    end
endmodule


