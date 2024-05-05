module MuxPC(
    input reg [31:0] PC_4,
    input reg [31:0] AluJump,
    input logic NextPCSrc, 
    output reg [31:0] NextPC = 32'h00000000 
);

always @* begin
    if (NextPCSrc) begin
        NextPC <= AluJump; 
    end else begin
        NextPC <= PC_4 + 4; 
    end
end

endmodule
