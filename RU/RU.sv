module RU (
  input logic clk,
  input logic ruWr,
  input logic [4:0] rs1,
  input logic [4:0] rs2,
  input logic [4:0] rd,
  input logic [31:0] DataWr,
  output logic [31:0] ruRs1,
  output logic [31:0] ruRs2
);

  logic [31:0] registers [0:31];

  initial begin
    for (int i = 0; i < 32; i++) begin
      registers[i] = 0;
    registers[2] = 5'b11111;
    end
  end

  assign ruRs1 = (rs1 == 0) ? 0 : registers[rs1];
  assign ruRs2 = (rs2 == 0) ? 0 : registers[rs2];

  always_ff @(posedge clk) begin
    if ((ruWr == 1) && (rd != 0))
      registers[rd] <= DataWr;
  end

endmodule