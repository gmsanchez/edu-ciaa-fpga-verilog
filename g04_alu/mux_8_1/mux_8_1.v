module mux_8_1 (
    input wire d0,
    input wire d1,
    input wire d2,
    input wire d3,
    input wire d4,
    input wire d5,
    input wire d6,
    input wire d7,
    input wire [2:0] sel,
    output reg o0  // La señal o0 se declara como reg porque se le asigna un valor dentro de un bloque procedural como always
);

    // Este bloque always se ejecuta siempre que alguna de las señales cambie de valor.
    // Cuando esto sucede, el valor de o0 cambia seǵun los valores de las entradas.
    always @(d0 or d1 or d2 or d3 or d4 or d5 or d6 or d7 or sel)
    begin
        case (sel)
            3'b000 : o0 = d0;
            3'b001 : o0 = d1;
            3'b010 : o0 = d2;
            3'b011 : o0 = d3;
            3'b100 : o0 = d4;
            3'b101 : o0 = d5;
            3'b110 : o0 = d6;
            3'b111 : o0 = d7;
            default: o0 = d0;
        endcase
    end
    
endmodule