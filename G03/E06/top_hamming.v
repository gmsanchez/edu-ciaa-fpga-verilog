`include "hamming_emisor/hamming_emisor.v"
`include "hamming_receptor/hamming_receptor.v"
`include "xor_7b/xor_7b.v"

module top_hamming(
    input wire [3:0] d_in,
    input wire [6:0] error,
    output wire [3:0] d_out
);

    wire [6:0] emisor_2_xor, xor_2_receptor;

    hamming_emisor hamming_emisor_0 (
        .d_in(d_in),
        .m_out(emisor_2_xor)
    );

    xor_7b xor_7b_0 (
        .d0(error),
        .d1(emisor_2_xor),
        .o0(xor_2_receptor)
    );

    hamming_receptor hamming_receptor_0 (
        .m_in(xor_2_receptor),
        .d_out(d_out)
    );

endmodule