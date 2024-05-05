module IU_Tb;
    reg [24:0] imm_tb;
    reg [2:0] src_tb;
    wire [31:0] ext_tb;

IU IU_inst(
    .imm(imm_tb),
    .src(src_tb),
    .ext(ext_tb)
);

initial begin
    $dumpfile("IU_Tb.vcd");
    $dumpvars(0, IU_Tb);

    imm_tb = 25'b0000000010100000000001000;
    src_tb = 3'b000;
    #10;

    imm_tb = 25'b0000000010100000000001000;
    src_tb = 3'b001;
    #10;

    imm_tb = 25'b0000000010100000000001000;
    src_tb = 3'b101;
    #10;

    imm_tb = 25'b0000000010100000000001000;
    src_tb = 3'b010;
    #10;

    imm_tb = 25'b0000000010100000000001000;
    src_tb = 3'b110;
    #10;
    $finish;
end

endmodule