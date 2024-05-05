`include "PC/PC.sv"
`include "IM/IM.sv"
`include "CU/CU.sv"
`include "RU/RU.sv"
`include "IU/IU.sv"
`include "ALU/ALU.sv"
`include "BU/BU.sv"
`include "DM/DM.sv"
`include "MuxPC.sv"

module monociclo(
        input clk
    );

    logic NEXT_PC_SRC; 
    logic [31:0] PC_OUT;
    logic [31:0] INSTRUCTION;
    logic RUWR, ALUASRC, ALUBSRC;
    logic [2:0] IMM_SRC;
    logic [4:0] BR_OP;
    logic [3:0] ALUOP;
    logic DM_WR;
    logic [2:0] DM_CTRL;
    logic [1:0] RUDATA_WR_SRC;
    logic [31:0] ALURES;
    logic [31:0] RU_RS1;
    logic [31:0] RU_RS2;
    logic [31:0] INALUA;
    logic [31:0] INALUB;
    logic [31:0] IMMEXT;
    logic [31:0] RU_DATA_WR;
    logic [31:0] DATA_RD;
    logic [31:0] PC_TEMP;

    MuxPC MuxPC_inst(
        .PC_4(PC_OUT),
        .AluJump(ALURES),
        .NextPCSrc(NEXT_PC_SRC),
        .NextPC(PC_TEMP)
    );

    PC PC_inst (
        .clk(clk),
        .PC_in(PC_TEMP),
        .PC_out(PC_OUT)
    );

    IM IM_inst(
        .address(PC_OUT),
        .instruction(INSTRUCTION)
    );

    CU CU_inst(
        .Opcode(INSTRUCTION[6:0]),
        .Function3(INSTRUCTION[14:12]),
        .Function7(INSTRUCTION[31:25]),
        .ImmSrc(IMM_SRC),
        .ALUASrc(ALUASRC),
        .ALUBSrc(ALUBSRC),
        .RUWr(RUWR),
        .BrOp(BR_OP),
        .ALUOp(ALUOP),
        .DMWr(DM_WR),
        .DMCtrl(DM_CTRL),
        .RUDataWrSrc(RUDATA_WR_SRC)
        );

    RU RU_inst(
        .clk(clk),
        .ruWr(RUWR),
        .rs1(INSTRUCTION[19:15]),
        .rs2(INSTRUCTION [24:20]),
        .rd(INSTRUCTION[11:7]),
        .DataWr(RU_DATA_WR),
        .ruRs1(RU_RS1),
        .ruRs2(RU_RS2)
        );

    IU IU_inst(
        .imm(INSTRUCTION[31:7]),
        .src(IMM_SRC),
        .ext(IMMEXT)
        );

    ALU ALU_inst (
        .A(INALUA),
        .B(INALUB),
        .ALUop(ALUOP),
        .ALUS(ALURES)
        );

    BU BU_inst(
        .A(RU_RS1),
        .B(RU_RS2),
        .BrOp(BR_OP),
        .NextPCSrc(NEXT_PC_SRC)
        );

    DM DM_inst (
        .Address(ALURES),
        .DataWr(RU_RS2),
        .DMWr(DM_WR),
        .DMCtrl(DM_CTRL),
        .DataRd(DATA_RD)
        );

    always @(*) begin
        if (ALUASRC == 1'b1) begin
            INALUA <= PC_OUT; 
        end 
        else begin
            INALUA <= RU_RS1;
        end
        if (ALUBSRC == 1'b1) begin
            INALUB <= IMMEXT;
        end
        else begin
            INALUB <= RU_RS2; 
        end
        case(RUDATA_WR_SRC)
            2'b00: RU_DATA_WR <= ALURES;
            2'b01: RU_DATA_WR <= DATA_RD;
            2'b10: RU_DATA_WR <= PC_TEMP;
        endcase
    end
endmodule