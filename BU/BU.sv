module BU(
        input logic [31:0] A,
        input logic [31:0] B,
        input logic [4:0] BrOp,
        output reg NextPCSrc
    );

    always @(*)
        case(BrOp)
            5'b00000 : NextPCSrc = 0;
            5'b11111 : NextPCSrc = 1;
            5'b01000 : NextPCSrc = (A == B);
            5'b01001 : NextPCSrc = (A != B);
            5'b01100 : NextPCSrc = ($signed(A) < $signed(B));
            5'b01101 : NextPCSrc = ($signed(A) >= $signed(B));
            5'b01110 : NextPCSrc = (A < B);
            5'b01111 : NextPCSrc = (A >= B);

            default NextPCSrc = 0;
        endcase
    
endmodule