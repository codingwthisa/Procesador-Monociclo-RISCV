module CU_Tb;
    reg [6:0] Opcode_tb;
    reg [2:0] Function3_tb;
    reg [6:0] Function7_tb;
    wire [2:0] ImmSrc_tb;
    wire ALUASrc_tb;
    wire ALUBSrc_tb;
    wire RUWr_tb;
    wire [4:0] BrOp_tb;
    wire [3:0] ALUOp_tb;
    wire DMWr_tb;
    wire [2:0] DMCtrl_tb;
    wire [1:0] RUDataWrSrc_tb;

    CU CU_inst(
        .Opcode(Opcode_tb),
        .Function3(Function3_tb),
        .Function7(Function7_tb),
        .ImmSrc(ImmSrc_tb),
        .ALUASrc(ALUASrc_tb),
        .ALUBSrc(ALUBSrc_tb),
        .RUWr(RUWr_tb),
        .BrOp(BrOp_tb),
        .ALUOp(ALUOp_tb),
        .DMWr(DMWr_tb),
        .DMCtrl(DMCtrl_tb),
        .RUDataWrSrc(RUDataWrSrc_tb)
    );

    initial begin
        $dumpfile("CU_tb.vcd");
        $dumpvars(0, CU_Tb);

        //Tipo R
        Opcode_tb = 7'b0110011;
        Function3_tb = 3'b000;
        Function7_tb = 7'b0100000;
        #10;

        //Tipo I
        Opcode_tb = 7'b0010011;
        #10;

        //Tipo B
        Opcode_tb = 7'b1100011;
        #10;

        //Tipo S
        Opcode_tb = 7'b0100011;
        #10;

        //Tipo I - Load
        Opcode_tb = 7'b0000011;
        #10;

        //Tipo I - Jalr
        Opcode_tb = 7'b1100111;
        #10;

        //Tipo J
        Opcode_tb = 7'b1101111;
        #10;

        //Tipo U - lui
        Opcode_tb = 7'b0110111;
        #10;

        //Tipo U - auipc
        Opcode_tb = 7'b0010111;
        #10;    
    end

endmodule