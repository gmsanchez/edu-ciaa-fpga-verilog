`include "sumador_completo_1_bit/sumador_completo_1_bit.v"
`include "restador_completo_1_bit/restador_completo_1_bit.v"
`include "mux_8_1/mux_8_1.v"

module top_alu (
    input wire a,
    input wire b,
    input wire c_in,
    input wire [2:0] op_code,
    output wire o,
    output wire p,
    output wire z,
    output wire c_out
);

wire suma_s, suma_c_out, resta_d, resta_b_out;
wire and_ab, or_ab, not_a;
wire tmp_o, tmp_c_out;

assign and_ab = a & b;
assign or_ab = a | b;
assign not_a = ~a;

sumador_completo_1_bit sumador_completo_1_bit_0 (
    .x(a),
    .y(b),
    .c_in(c_in),
    .s(suma_s),
    .c_out(suma_c_out)
);

restador_completo_1_bit restador_completo_1_bit_0 (
    .x(a),
    .y(b),
    .b_in(c_in),
    .d(resta_d),
    .b_out(resta_b_out)
);

mux_8_1 mux_8_1_o (
    .d0(1'b0),
    .d1(suma_s),
    .d2(resta_d),
    .d3(1'b0),
    .d4(or_ab),
    .d5(and_ab),
    .d6(not_a),
    .d7(1'b0),
    .sel(op_code),
    .o0(tmp_o)
);

mux_8_1 mux_8_1_c (
    .d0(1'b0),
    .d1(suma_c_out),
    .d2(resta_b_out),
    .d3(1'b0),
    .d4(1'b0),
    .d5(1'b0),
    .d6(1'b0),
    .d7(1'b0),
    .sel(op_code),
    .o0(tmp_c_out)
);

assign o = tmp_o;
assign c_out = tmp_c_out;
assign p = tmp_o ^ 1'b0;
assign z = ~(tmp_o);

endmodule