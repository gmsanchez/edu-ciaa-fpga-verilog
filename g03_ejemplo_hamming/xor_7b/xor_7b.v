module xor_7b (
    input wire [6:0] d0,
    input wire [6:0] d1,
    output wire [6:0] o0
);

    assign o0 = d0 ^ d1;
    
endmodule