module Clock(
    input i_clk,
    output reg o_delayClock = 0
);
    reg [1:0] count = 2'b00;

    always @(posedge i_clk) begin
        if (count == 2'b11) begin
            count <= 2'b00;
            o_delayClock <= ~o_delayClock;
        end else begin
            count <= count + 1;
        end
    end
endmodule