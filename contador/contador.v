module contador (
    input wire clk,
    input wire reset,
    input wire up,
    input wire down,
    output wire [3:0] count
);

reg [3:0] count_reg, next_count_reg;

always @(posedge clk, posedge reset)
begin
    if (reset)
    begin
        count_reg <= 4'b0000;
    end
    else
    begin
        count_reg <= next_count_reg;
    end
end

always @*
begin
    next_count_reg = count_reg;
    if (up)
        next_count_reg = next_count_reg + 4'b0001;
    
    if (down)
        next_count_reg = next_count_reg - 4'b0001;
end

assign count = count_reg;

endmodule