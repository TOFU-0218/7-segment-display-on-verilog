module Counter(
    input i_clk,
    output reg [1:0] o_count = 0
);
    always @(posedge i_clk) begin
        o_count <= o_count + 1;
    end
endmodule