module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUop,
    output reg [31:0] ALUS
    );

    always @(*)
      
    begin
        case(ALUop)
            4'b0000: ALUS = A + B; // Suma
            4'b1000: ALUS = A - B; // Resta
            4'b0111: ALUS = A & B; // AND
            4'b0110: ALUS = A | B; // OR
            4'b0100: ALUS = A ^ B; // XOR
            4'b0001: ALUS = A << B; // Corrimiento lógico izquierdo.
            4'b0101: ALUS = A >> B; // Corrimiento lógico derecho.
            4'b1101: ALUS = A >>> B; // Corrimiento aritmético a la derecha.
            4'b0010: ALUS = ($signed(A) < $signed(B)); // Menor que B (con signo)
            4'b0011: ALUS = A < B; // Menor que B (sin signo)
            default: ALUS = 32'b0; // Default en caso de ALUop desconocido
        endcase
    end
endmodule
