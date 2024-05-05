module IM(
    input [31:0] address,
    output reg [31:0] instruction
);

    logic [7:0] ins_mem [0:31];
    reg [7:0] out1, out2, out3, out4;

    initial begin
        $readmemb("IM/instructions.txt", ins_mem);
    end

    always @(*) begin
       out1 = ins_mem[address];
       out2 = ins_mem[address + 1];
       out3 = ins_mem[address + 2];
       out4 = ins_mem[address + 3];
       instruction = {out1, out2, out3, out4};
    end

endmodule
