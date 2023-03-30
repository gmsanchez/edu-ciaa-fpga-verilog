module sumador_completo_1_bit (
    input wire x,
    input wire y,
    input wire c_in,
    output wire s,
    output wire c_out
);

wire xor_xy;

assign xor_xy = x ^ y;
assign s = xor_xy ^ c_in;
assign c_out = (x & y) | (c_in & xor_xy);
    
endmodule