module contador_02 (
    input wire clk,
    input wire reset,
    input wire up,
    input wire down,
    output wire [3:0] count
);

reg [3:0] count_reg;

always @(posedge clk)
begin
    if (reset)
        count_reg <= 4'b0000;
    if (up)
        count_reg <= count_reg + 4'b0001;
    if (down)
        count_reg <= count_reg - 4'b0001;
end

assign count = count_reg;

endmodule