module BCDTo7Segment(
    input [15:0] i_BCD,
    output [7:0] o_data_1,
    output [7:0] o_data_2,
    output [7:0] o_data_3,
    output [7:0] o_data_4
);
    assign o_data_1 = conversion_BCD(i_BCD[3:0]);
    assign o_data_2 = conversion_BCD(i_BCD[7:4]);
    assign o_data_3 = conversion_BCD(i_BCD[11:8]);
    assign o_data_4 = conversion_BCD(i_BCD[15:12]);
    //=================
    //各数字の変換説明
    //#A#
    //F#B
    //#G#
    //E#C
    //#D#DP
    //=================
    //#0#
    //5#1
    //#6#
    //4#2
    //#3#7
    //=================

    function [7:0]conversion_BCD(
        input [3:0] i_BCD
    );
        case(i_BCD)
            4'b0000 : conversion_BCD = 8'b00111111; // 0
            4'b0001 : conversion_BCD = 8'b00000110; // 1
            4'b0010 : conversion_BCD = 8'b01011011; // 2
            4'b0011 : conversion_BCD = 8'b01001111; // 3
            4'b0100 : conversion_BCD = 8'b01100110; // 4
            4'b0101 : conversion_BCD = 8'b01101101; // 5
            4'b0110 : conversion_BCD = 8'b01111101; // 6
            4'b0111 : conversion_BCD = 8'b00000111; // 7
            4'b1000 : conversion_BCD = 8'b01111111; // 8
            4'b1001 : conversion_BCD = 8'b01101111; // 9
            default : conversion_BCD = 8'b01111001; // default:E
        endcase
    endfunction
endmodule