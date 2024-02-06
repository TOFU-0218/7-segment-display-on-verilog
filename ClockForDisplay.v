module ClockForDisplay(
    input i_clk,
    output reg o_clockForDisplay = 0
);
    reg [16:0] count = 17'b0;

    always @(posedge i_clk) begin
        if (count == 17'b10000011110101100) begin
            count <= 17'b0;
            o_clockForDisplay <= ~o_clockForDisplay;
        end else begin
            count <= count + 1;
        end
    end
endmodule