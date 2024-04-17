// 10-Line to 4-Line BCD Priority Encoder
// Based on Texas Instrument CD40147B datasheet
// This example uses continuous assignment

module cd40147_assign (
    input wire [9:0] i,
    output wire [3:0] o
);

assign o = i[9] ? 4'b1001 : // 9
           i[8] ? 4'b1000 : // 8
           i[7] ? 4'b0111 : // 7
           i[6] ? 4'b0110 : // 6
           i[5] ? 4'b0101 : // 5
           i[4] ? 4'b0100 : // 4
           i[3] ? 4'b0011 : // 3
           i[2] ? 4'b0010 : // 2
           i[1] ? 4'b0001 : // 1
           i[0] ? 4'b0000 : // 0
           4'b1111;
    
endmodule