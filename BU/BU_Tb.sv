module BU_Tb();
    reg [31:0] A_tb;
    reg [31:0] B_tb;
    reg [4:0] BrOp_tb;
    wire NextPCSrc_tb;

    BU BU_inst(
        .A(A_tb),
        .B(B_tb),
        .BrOp(BrOp_tb),
        .NextPCSrc(NextPCSrc_tb)
    );

    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars;

        A_tb = 32'h00000005;
        B_tb = 32'h00000007;

        BrOp_tb = 5'b00000;
        #10;

        BrOp_tb = 5'b01000;
        #10;

        BrOp_tb = 5'b01001;
        #10;

        BrOp_tb = 5'b01100;
        #10;

        BrOp_tb = 5'b01101;
        #10;

        A_tb = -32'h00000005;
        BrOp_tb = 5'b01110;
        #10;

        A_tb = -32'h00000005;
        BrOp_tb = 5'b01111;
        #10;

        A_tb = 32'h00000005;
        BrOp_tb = 5'b11111;
        #10;

        $finish;
    end
endmodule