module MUX(
    input [8:0] i_data_0,
    input [8:0] i_data_1,
    input [8:0] i_data_2,
    input [8:0] i_data_3,
    input i_clk,
    input i_rst,
    input [1:0] i_ctrl,
    output reg [8:0] o_data
);
    always @(posedge i_clk) begin
        if (i_rst) begin
            o_data <= 9'b0;
        end else begin
            case(i_ctrl)
                2'b00 : o_data <= i_data_0;
                2'b01 : o_data <= i_data_1;
                2'b10 : o_data <= i_data_2;
                2'b11 : o_data <= i_data_3;
                default : o_data <= 9'b0;
            endcase
        end
    end
endmodule
