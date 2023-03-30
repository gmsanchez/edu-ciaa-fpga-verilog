module restador_completo_1_bit (
    input wire x,
    input wire y,
    input wire b_in,
    output wire d,
    output wire b_out
);

    wire xor_xy;

    assign xor_xy = x ^ y;
    assign d = xor_xy ^ b_in;
    assign b_out = (~x & y) | (b_in & xor_xy);
    
endmodule