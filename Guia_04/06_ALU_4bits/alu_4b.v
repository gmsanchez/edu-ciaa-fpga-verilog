// ALU de 4 bits

// Resta compatibilizar para pueda conectarse en paralelo con otras
// y así expandir el ancho de palabra (bit slicing)

// Operaciones:
// 0001: AND (A & B)
// 0010: OR  (A | B)
// 0011: XOR (A ^ B)
// 0101: Suma (A + B)
// 0110: Resta (A - B)
// 1001: Comparación (A < B) --> salida = 1 si A es menor, 0 en caso contrario
// 1010: Comparación (A == B) --> salida = 1 si A es igual a B, 0 si no lo es
// 1101: Desplazar a la derecha (logical right shift)
// 1110: Desplazar a la izquierda (logical left shift)

module alu_4b (
    input  [3:0] A,            // Operando A (4 bits)
    input  [3:0] B,            // Operando B (4 bits)
    input  [3:0] opcode,       // Señal de operación (4 bits)
    output reg [3:0] result    // Resultado de la operación (4 bits)
);

always @(*) begin
    case (opcode)
        4'b0001: result = A & B;            // AND
        4'b0010: result = A | B;            // OR
        4'b0011: result = A ^ B;            // XOR
        4'b0101: result = A + B;            // Suma
        4'b0110: result = A - B;            // Resta
        4'b1001: result = (A < B) ? 4'b0001 : 4'b0000; // Comparación menor: salida 1 si A < B, 0 en otro caso.
        4'b1010: result = (A == B) ? 4'b0001 : 4'b0000; // Comparación igual: salida 1 si A == B, 0 en otro caso.
        4'b1101: result = A >> 1;           // Desplazamiento a la derecha (logical)
        4'b1110: result = A << 1;           // Desplazamiento a la izquierda (logical)
        default: result = 4'b0000;          // Por defecto, salida 0
    endcase
end

endmodule
