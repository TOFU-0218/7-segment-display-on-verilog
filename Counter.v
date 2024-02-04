module Counter(
    input i_rst,
    input i_countUpClicked,
    output reg [13:0] o_count
);
    always @(posedge i_countUpClicked or posedge i_rst) begin
        if(i_rst) begin
            o_count <= 14'b0;
        end else begin
            o_count <= o_count + 1;
        end
    end
endmodule