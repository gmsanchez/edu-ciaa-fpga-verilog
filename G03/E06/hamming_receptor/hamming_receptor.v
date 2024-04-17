module hamming_receptor (
    input wire [6:0] m_in,
    output wire [3:0] d_out
);

    wire [2:0] c;

    // Primero calculamos los bits de check
    assign c[2] = m_in[3] ^ m_in[6] ^ m_in[5] ^ m_in[4];
    assign c[1] = m_in[1] ^ m_in[6] ^ m_in[5] ^ m_in[2];
    assign c[0] = m_in[0] ^ m_in[6] ^ m_in[4] ^ m_in[2];

    // Ahora asigno los bits de datos y corrijo si fuera necesario
    assign d_out[3] = (c == 3'b111) ? ~m_in[6] : m_in[6];
    assign d_out[2] = (c == 3'b110) ? ~m_in[5] : m_in[5];
    assign d_out[1] = (c == 3'b101) ? ~m_in[4] : m_in[4];
    assign d_out[0] = (c == 3'b011) ? ~m_in[2] : m_in[2];
    
endmodule