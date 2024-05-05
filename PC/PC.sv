module PC(
    input clk,
    input logic [31:0] PC_in,
    output logic [31:0] PC_out
);

initial begin
    PC_out = 32'b0;
end

always @(posedge clk) begin
    PC_out <= PC_in;
end

endmodule

