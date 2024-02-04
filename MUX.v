module MUX(
    input [7:0] i_data_0,
    input [7:0] i_data_1,
    input [7:0] i_data_2,
    input [7:0] i_data_3,
    input [1:0] i_ctrl,
    output [7:0] o_data
);
    assign o_data = (i_ctrl == 2'b00) ? i_data_0 :
                    (i_ctrl == 2'b01) ? i_data_1 :
                    (i_ctrl == 2'b10) ? i_data_2 :
                    (i_ctrl == 2'b11) ? i_data_3 :
                    8'b0;

endmodule
