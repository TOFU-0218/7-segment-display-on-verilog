module BCDTo7Segment_tb;
    reg [15:0] i_BCD =  16'b0;
    wire [7:0] o_data_1;
    wire [7:0] o_data_2;
    wire [7:0] o_data_3;
    wire [7:0] o_data_4;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, DUT);
    end

    BCDTo7Segment DUT(
        .i_BCD  (i_BCD  ),
        .o_data_1(o_data_1),
        .o_data_2(o_data_2),
        .o_data_3(o_data_3),
        .o_data_4(o_data_4)
    );

    initial begin
        i_BCD <= 16'b0000000100100011;
        #2
        i_BCD <= 16'b0100010101100111;
        #2
        i_BCD <= 16'b1000100100001111;
        #2
        i_BCD <= 16'b0000000000000000;
        #2
        i_BCD <= 16'b1111101011000000;
        #2
        $finish;
    end
endmodule