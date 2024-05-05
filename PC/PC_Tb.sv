module PC_Tb;
    reg clk_tb;
    reg [31:0] PC_in_tb;
    wire [31:0] PC_out_tb;

    PC PC_inst (
        .clk(clk_tb),
        .PC_in(PC_in_tb),
        .PC_out(PC_out_tb)
    );

    always #5 clk_tb = ~clk_tb;

    initial begin
        $dumpfile("PC_tb.vcd");
        $dumpvars(0, PC_Tb);

        clk_tb = 0;

        PC_in_tb = 32'h0000005C;
        #10; 
        PC_in_tb = 32'h00000060;
        #10;
        PC_in_tb = 32'h00000064;
        #10;
        PC_in_tb = 32'h00000000;
        #10;
        PC_in_tb = 32'h00000004;
        #10;
        
        $finish;

    end
endmodule