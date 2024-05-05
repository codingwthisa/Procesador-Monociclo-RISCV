module DM(
        input [31:0] Address,
        input [31:0] DataWr,
        input DMWr,
        input [2:0] DMCtrl,
        output reg [31:0] DataRd
    );

    logic [7:0] data_mem [31:0];
    logic [7:0] data1, data2, data3, data4;
    logic [7:0] out1, out2, out3, out4;

    initial begin
        for (int i = 0; i < 32; i++) begin
            data_mem[i] = 8'b0;
        end
    end

    always @(*) begin
       data1 = DataWr[31:24];
       data2 = DataWr[23:16];
       data3 = DataWr[15:8];
       data4 = DataWr[7:0];

        if (DMWr == 1) begin
            case (DMCtrl)
                3'b000 :
                    begin 
                        data_mem[Address] = data4;
                        data_mem[Address + 1] = 8'b0;
                        data_mem[Address + 2] = 8'b0;
                        data_mem[Address + 3] = 8'b0;
                    end
                3'b001 : 
                    begin 
                        data_mem[Address] = data4;
                        data_mem[Address + 1] = data3;
                        data_mem[Address + 2] = 8'b0;
                        data_mem[Address + 3] = 8'b0;
                    end
                3'b010 : 
                    begin
                        data_mem[Address] = data4;
                        data_mem[Address + 1] = data3;
                        data_mem[Address + 2] = data2;
                        data_mem[Address + 3] = data1;
                    end 
            endcase
        end
        else begin 
            case (DMCtrl)
                3'b000 : 
                    begin
                        out4 = data_mem[Address];
                        DataRd = {{24{out4[7]}}, out4};
                    end 
                3'b001:
                    begin
                        out4 = data_mem[Address];
                        out3 = data_mem[Address + 1];
                        DataRd = {{16{out3[7]}}, out3, out4};
                    end 
                3'b010:
                    begin
                        out4 = data_mem[Address];
                        out3 = data_mem[Address + 1];
                        out2 = data_mem[Address + 2];
                        out1 = data_mem[Address + 3];
                        DataRd = {out1, out2, out3, out4};
                    end 
                3'b100 :
                    begin
                        out4 = data_mem[Address];
                        DataRd = {{24{1'b0}}, out4};
                    end 
                3'b101 :
                    begin
                        out4 = data_mem[Address];
                        out3 = data_mem[Address + 1];
                        DataRd = {{16{1'b0}}, out3, out4};
                    end 
            endcase
        end
    end
endmodule