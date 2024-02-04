module Counter(
    input i_clk,
    input i_rst,
    output reg [1:0] o_ctrl = 2'b00,
    output reg [3:0] o_digitSelect = 4'b1110 
);
    always @(posedge i_clk) begin
        if (i_rst) begin
            o_ctrl <= 2'b00;
            o_digitSelect <= 4'b1110;
        end else begin
            o_ctrl = o_ctrl + 1; // ブロッキング代入にするとなぜか動く。要修正。
            case (o_ctrl)
                2'b00 : o_digitSelect <= 4'b1110;
                2'b01 : o_digitSelect <= 4'b1101;
                2'b10 : o_digitSelect <= 4'b1011;
                2'b11 : o_digitSelect <= 4'b0111;
                default : o_digitSelect <= 4'b1111; // 桁選択は不論理のため注意
            endcase
        end
    end
endmodule