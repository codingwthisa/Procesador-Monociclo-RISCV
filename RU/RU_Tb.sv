module RU_Tb;
    logic clk_tb;
    logic ruWr_tb;
    logic [4:0] rs1_tb;
    logic [4:0] rs2_tb;
    logic [4:0] rd_tb;
    logic [31:0] DataWr_tb;
    logic [31:0] ruRs1_tb;
    logic [31:0] ruRs2_tb;

    RU RU_inst(
        .clk(clk_tb),
        .ruWr(ruWr_tb),
        .rs1(rs1_tb),
        .rs2(rs2_tb),
        .rd(rd_tb),
        .DataWr(DataWr_tb),
        .ruRs1(ruRs1_tb),
        .ruRs2(ruRs2_tb)
    );
    
    always #5 clk_tb = ~clk_tb; 

    initial begin
        $dumpfile("RU_tb.vcd");
        $dumpvars(0, RU_Tb);

        clk_tb = 0;
        ruWr_tb = 1;
        rs2_tb = 5'b01000;

        rd_tb = 5'b01010;
        DataWr_tb = 32'b01100111011001110110011101100111;
        rs1_tb = 5'b01010;
        #10;

        rd_tb = 5'b01000;
        DataWr_tb = 32'b01100111011001110110011101100000;
        rs1_tb = 5'b01000;
        #10;

        rd_tb = 5'b01001;
        DataWr_tb = 32'b01100111011000000110011101100111;
        rs1_tb = 5'b01001;
        #10;

        rd_tb = 5'b01011;
        DataWr_tb = 32'b01100111011011000110011111100111;
        rs1_tb = 5'b01011;
        #10;

        $finish;
    end

endmodule