module IM_Tb;
    reg [31:0] address_tb;
    wire [31:0] instruction_tb;

    IM IM_inst(
        .address(address_tb),
        .instruction(instruction_tb)
    );

    initial begin
        $dumpfile("IM_tb.vcd");
        $dumpvars(0, IM_Tb);

        address_tb = 0;
        #10;

        address_tb = 4;
        #10;

        address_tb = 8;
        #10;

        address_tb = 12;
        #10;

        address_tb = 16;
        #10;

        address_tb = 20;
        #10;

        address_tb = 24;
        #10;

        address_tb = 28; 
        #10;
        
        $finish;
    end
endmodule
