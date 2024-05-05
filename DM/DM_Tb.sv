module DM_Tb;
    reg [31:0] Address_tb;
    reg [31:0] DataWr_tb;
    reg DMWr_tb;
    reg [2:0] DMCtrl_tb;
    wire [31:0] DataRd_tb;

    DM DM_inst (
        .Address(Address_tb),
        .DataWr(DataWr_tb),
        .DMWr(DMWr_tb),
        .DMCtrl(DMCtrl_tb),
        .DataRd(DataRd_tb)
    );

    always #5 DMWr_tb = ~DMWr_tb;

    initial begin
        $dumpfile("DM_tb.vcd");
        $dumpvars(0, DM_Tb);

        DMWr_tb = 1;
        DMCtrl_tb = 3'b010;
        DataWr_tb = 32'b01010101010101010101010101010101;
        Address_tb = 32'b0;
        #10;
        
        DataWr_tb = 32'b00000000000000000000000000000001;
        Address_tb = 4;
        #10;

        DataWr_tb = 32'b00000000000111111111110000001111;
        Address_tb = 8;
        #10;

        DataWr_tb = 32'b01010101011101010101010101111111;
        Address_tb = 12;
        #10;

        DataWr_tb = 32'b01010101111111111101010101010101;
        Address_tb = 16;
        #10;

        DataWr_tb = 32'b10101010101011111111000010101010;
        Address_tb = 20;
        #10;

        DataWr_tb = 32'b01010111111000010101010101010101;
        Address_tb = 24;
        #10;

        DataWr_tb = 32'b01011111100000110101010101010101;
        Address_tb = 28;
        #10;
        $finish;
    end
endmodule