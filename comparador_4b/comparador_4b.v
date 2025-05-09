module comparador_4b (
    input wire [3:0] a, b,
    output wire G, L, E
);

assign G = (a > b);
assign L = (a < b);
assign E = (a == b);

endmodule
