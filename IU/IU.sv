module IU(
    input [24:0] imm,
    input [2:0] src,
    output reg [31:0] ext
);

always @(*) begin
    case(src)
        3'b000: ext = (imm[7:5] == 3'b101 || imm[7:5] == 3'b001) ? {{27{imm[17]}},imm[17:13]} : { {20{imm[24]}}, imm[24:13] }; //Tipo I
        3'b001: ext = {{20{imm[24]}}, imm[24:18], imm[4:0]}; // Tipo S
        3'b101: ext = {{20{imm[24]}}, imm[0], imm[23:18], imm[4:1], 1'b0 }; // Tipo B
        3'b010: ext = {imm[24:5], 12'b0}; // Tipo U
        3'b110: ext = {{12{imm[24]}},imm[12:5], imm[13], imm[23:14], 1'b0}; // Tipo J
    endcase
end

endmodule