// 10-Line to 4-Line BCD Priority Encoder
// Based on Texas Instrument CD40147B datasheet
// This example uses an always block and casez to handle don't cares

module cd40147_always (
    input wire [9:0] i,
    output wire [3:0] o
);

reg [3:0] o_reg;

always @(*) begin
    casez (i)
        10'b0000000000: o_reg = 4'b1111;
        10'b0000000001: o_reg = 4'b0000; // 0
        10'b000000001?: o_reg = 4'b0001; // 1
        10'b00000001??: o_reg = 4'b0010; // 2
        10'b0000001???: o_reg = 4'b0011; // 3
        10'b000001????: o_reg = 4'b0100; // 4
        10'b00001?????: o_reg = 4'b0101; // 5
        10'b0001??????: o_reg = 4'b0110; // 6
        10'b001???????: o_reg = 4'b0111; // 7
        10'b01????????: o_reg = 4'b1000; // 8
        10'b1?????????: o_reg = 4'b1001; // 9
        default: o_reg = 4'b1111;
    endcase
end

assign o = o_reg;
    
endmodule