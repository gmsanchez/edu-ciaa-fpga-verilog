module contador_ud_p 
    #(
        parameter W = 4
    )
(
    input wire clk,
    input wire reset,
    input wire up,
    input wire down,
    output wire [W-1:0] count
);

reg [W-1:0] count_reg = 0;

always @(posedge clk)
begin
    if (reset)
        count_reg <= 0;
    if (up)
        count_reg <= count_reg + 1;
    if (down)
        count_reg <= count_reg - 1;
end

assign count = count_reg;

endmodule