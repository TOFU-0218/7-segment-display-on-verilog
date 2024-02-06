module ClockForDisplay(
    input i_clk,
    output reg o_clockForDisplay = 0
);
    reg [18:0] count = 19'b0;

    always @(posedge i_clk) begin
        if (count == 19'b1000001111010110000) begin
            count <= 19'b0;
            o_clockForDisplay <= ~o_clockForDisplay;
        end else begin
            count <= count + 1;
        end
    end
endmodule