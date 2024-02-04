module TOP(
    input i_clk,
    input i_rst,
    input i_countUpClicked,
    output [3:0] o_digitSelect,
    output [7:0] o_LED
);
    // カウンター
    wire [13:0] count;
    Counter Counter(
        .i_rst(i_rst),
        .i_countUpClicked(i_countUpClicked),
        .o_count(count)
    );

    // バイナリからBCDに変換
    wire [15:0] BCD;
    BinToBCD BinToBCD(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_count(count),
        .o_BCD(BCD)
    );
    
    // BCDから7セグ用の信号に変換
    wire [7:0] data_0;
    wire [7:0] data_1;
    wire [7:0] data_2;
    wire [7:0] data_3;
    BCDTo7Segment BCDTo7Segment(
        .i_BCD(BCD),
        .o_data_0(data_0),
        .o_data_1(data_1),
        .o_data_2(data_2),
        .o_data_3(data_3)
    );
    
    // 桁選択用の信号
    wire [1:0] ctrl;
    DigitSelect DigitSelect(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .o_ctrl(ctrl),
        .o_digitSelect(o_digitSelect)
    );

    // マルチプレクサ
    MUX MUX(
        .i_data_0(data_0),
        .i_data_1(data_1),
        .i_data_2(data_2),
        .i_data_3(data_3),
        .i_rst(i_rst),
        .i_ctrl(ctrl),
        .o_data(o_LED)
    );
endmodule