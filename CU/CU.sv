module CU(
        input [6:0] Opcode,
        input [2:0] Function3,
        input [6:0] Function7,
        output logic [2:0] ImmSrc = 3'b000,
        output logic ALUASrc = 0,
        output logic ALUBSrc = 0,
        output logic RUWr = 0,
        output logic [4:0] BrOp = 5'b00000,
        output logic [3:0] ALUOp = 4'b0000,
        output logic DMWr = 0,
        output logic [2:0] DMCtrl = 3'b000,
        output logic [1:0] RUDataWrSrc = 2'b00
    );

    always @(*) begin
        case(Opcode)
            7'b0110011: begin //Tipo R
                ImmSrc = 3'b000; 
                BrOp = 5'b00000; 
                DMWr = 1'b0; 
                DMCtrl = 3'b000; 
                RUWr = 1'b1; 
                ALUASrc = 1'b0; 
                ALUBSrc = 1'b0; 
                ALUOp = {Function7[5], Function3[2:0]};
                RUDataWrSrc = 2'b00;    
            end
            7'b0010011: begin //Tipo I
                ImmSrc = 3'b000;
                BrOp = 5'b00000;
                DMWr = 1'b0;
                DMCtrl = 3'b000;
                RUWr = 1'b1; 
                ALUASrc = 1'b0;
                ALUBSrc = 1'b1;
                if (Function3 == 3'b101 || 3'b001) begin
                    ALUOp = {Function7[5], Function3[2:0]};
                end else begin
                    ALUOp = {1'b0,Function3[2:0]};
                end
                RUDataWrSrc = 2'b00;
            end
            7'b1100011: begin //Tipo B
                ImmSrc = 3'b101;  
                BrOp = {2'b01, Function3[2:0]};
                DMWr = 1'b0;
                DMCtrl = 3'b000;
                RUWr = 1'b0;
                ALUASrc = 1'b1;
                ALUBSrc = 1'b1;
                ALUOp = 4'b0000;
                RUDataWrSrc = 2'b00;
            end
            7'b0100011: begin //Tipo S
                ImmSrc = 3'b001;  
                BrOp = 5'b00000;
                DMWr = 1'b1;
                DMCtrl = Function3[2:0];
                RUWr = 1'b0;
                ALUASrc = 1'b0;
                ALUBSrc = 1'b1;
                ALUOp = 4'b0000;
                RUDataWrSrc = 2'b00;
            end 
            7'b0000011: begin //Tipo I - Load
                ImmSrc = 3'b000;  
                BrOp = 5'b00000;
                DMWr = 1'b0;
                DMCtrl = Function3[2:0];
                RUWr = 1'b1;
                ALUASrc = 1'b0;
                ALUBSrc = 1'b1;
                ALUOp = 4'b0000;
                RUDataWrSrc = 2'b01;
            end
            7'b1100111: begin //Tipo I - Jalr
                ImmSrc = 3'b000;  
                BrOp = 5'b11111;
                DMWr = 1'b0;
                DMCtrl = 3'b000;
                RUWr = 1'b0;
                ALUASrc = 1'b0;
                ALUBSrc = 1'b1;
                ALUOp = 4'b0000;
                RUDataWrSrc = 2'b00;
            end  
            7'b1101111: begin //Tipo J
                ImmSrc = 3'b110;  
                BrOp = 5'b11111;
                DMWr = 1'b0;
                DMCtrl = 3'b000;
                RUWr = 1'b1;
                ALUASrc = 1'b1;
                ALUBSrc = 1'b1;
                ALUOp = 4'b0000;
                RUDataWrSrc = 2'b10;
            end 
            7'b0110111: begin //Tipo U - lui
                ImmSrc = 3'b010;  
                BrOp = 5'b00000;
                DMWr = 1'b0;
                DMCtrl = 3'b000;
                RUWr = 1'b1;
                ALUASrc = 1'b0;
                ALUBSrc = 1'b1;
                ALUOp = 4'b0000;
                RUDataWrSrc = 2'b00;
            end 
            7'b0010111: begin //Tipo U - auipc
                ImmSrc = 3'b010;  
                BrOp = 5'b00000;
                DMWr = 1'b0;
                DMCtrl = 3'b000;
                RUWr = 1'b1;
                ALUASrc = 1'b1;
                ALUBSrc = 1'b1;
                ALUOp = 4'b0000;
                RUDataWrSrc = 2'b00;
            end 

        default BrOp = 5'b00000;

        endcase
    end
endmodule