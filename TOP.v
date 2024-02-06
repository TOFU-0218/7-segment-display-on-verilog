module TOP(
    input i_clk,
    input i_rst,
    input i_countUpClicked,
    output [3:0] o_digitSelect,
    output [7:0] o_LED
);
    assign not_i_rst = ~i_rst;
    assign not_i_countUpClicked = ~i_countUpClicked;

    /*
    // 遅延クロック
    wire delayClock;
    Clock Clock(
        .i_clk(i_clk),
        .o_delayClock(delayClock)
    );
    */

    // カウンター
    wire [13:0] count;
    Counter Counter(
        .i_rst(not_i_rst),
        .i_countUpClicked(not_i_countUpClicked),
        .o_count(count)
    );

    // バイナリからBCDに変換
    wire [15:0] BCD;
    BinToBCD BinToBCD(
        .i_clk(i_clk),
        .i_rst(not_i_rst),
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
    
    // ディスプレイ用のクロック信号を生成
    wire clockForDispaly;
    ClockForDisplay ClockForDisplay(
        .i_clk(i_clk),
        .o_clockForDisplay(clockForDispaly)
    );
    
    // 桁選択用の信号
    wire [1:0] ctrl;
    wire [3:0] not_o_digitSelect;
    DigitSelect DigitSelect(
        .i_clk(clockForDispaly),
        .i_rst(not_i_rst),
        .o_ctrl(ctrl),
        .o_digitSelect(not_o_digitSelect)
    );
    assign o_digitSelect = ~not_o_digitSelect;

    // マルチプレクサ
    wire [7:0] not_data_0;
    wire [7:0] not_data_1;
    wire [7:0] not_data_2;
    wire [7:0] not_data_3;
    assign not_data_0 = ~data_0;
    assign not_data_1 = ~data_1;
    assign not_data_2 = ~data_2;
    assign not_data_3 = ~data_3;
    MUX MUX(
        .i_data_0(not_data_0),
        .i_data_1(not_data_1),
        .i_data_2(not_data_2),
        .i_data_3(not_data_3),
        .i_ctrl(ctrl),
        .o_data(o_LED)
    );
endmodule