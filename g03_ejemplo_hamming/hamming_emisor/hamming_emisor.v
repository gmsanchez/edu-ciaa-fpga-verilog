module hamming_emisor (
    input wire [3:0] d_in,
    output wire [6:0] m_out
);

    // Primero coloco los bits del mensaje en su posicion
    assign m_out[6] = d_in[3];
    assign m_out[5] = d_in[2];
    assign m_out[4] = d_in[1];
    assign m_out[2] = d_in[0];
    
    // Ahora calculo los bits de paridad
    assign m_out[3] = d_in[3] ^ d_in[2] ^ d_in[1]; // P2
    assign m_out[1] = d_in[3] ^ d_in[2] ^ d_in[0]; // P1
    assign m_out[0] = d_in[3] ^ d_in[1] ^ d_in[0]; // P0
    
endmodule