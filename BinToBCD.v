module BinToBCD(
    input i_clk,
    input i_rst,
    input [13:0] i_count,
    output reg [15:0] o_BCD
);
    reg [13:0] temp1 = 14'b0;
    reg [13:0] temp2 = 14'b0;
    reg [13:0] thousands = 4'b0;
    reg [13:0] hundreds = 4'b0;
    reg [13:0] tens = 4'b0;
    reg [13:0] ones = 4'b0;

    always @(posedge i_clk) begin
        if (i_rst) begin
            o_BCD <= 16'b0;
        end else begin
            thousands = i_count / 14'd1000;
            temp1 = i_count - thousands * 14'd1000;
            hundreds = temp1 / 14'd100;
            temp2 = temp1 - hundreds * 14'd100;
            tens = temp2 / 14'd10;
            ones = temp2 - tens * 14'd10;
            o_BCD = {thousands[3:0], hundreds[3:0], tens[3:0], ones[3:0]};
        end
    end
endmodule
