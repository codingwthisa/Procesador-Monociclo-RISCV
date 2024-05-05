module ALU_Tb();
  reg [31:0] A_tb, B_tb;
  reg [3:0] ALUop_tb; 
  wire [31:0] ALUs_tb;

  ALU ALU_inst (
    .A(A_tb),
    .B(B_tb),
    .ALUop(ALUop_tb),
    .ALUS(ALUs_tb)
  );
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;

    //Suma
    A_tb = 32'h00000005;
    B_tb = 32'h00000007;
    ALUop_tb = 4'b0000;
    
    #10;

    //Resta
    A_tb = 32'h00000005;
    B_tb = 32'h00000007;
    ALUop_tb = 4'b1000;
    
    #10;

    //AND
    A_tb = 32'h00000005;
    B_tb = 32'h00000007;
    ALUop_tb = 4'b0111;
    
    #10;

    //OR
    A_tb = 32'h00000005;
    B_tb = 32'h00000007;
    ALUop_tb = 4'b0110;
    
    #10;

    //XOR
    A_tb = 32'h00000005;
    B_tb = 32'h00000007;
    ALUop_tb = 4'b0100;
    
    #10;

    //Corrimiento lógico izquierdo.
    A_tb = 32'h00000005;
    ALUop_tb = 4'b0001;
    
    #10;

    //Corrimiento lógico derecho.
    A_tb = 32'h00000005;
    ALUop_tb = 4'b0101;
    
    #10;

    //Corrimiento aritmético a la derecha.
    A_tb = 32'h00000005;
    ALUop_tb = 4'b1101;
    
    #10;

    // Menor que B (con signo)
    A_tb = -32'h00000005;
    B_tb = 32'h00000005;
    ALUop_tb = 4'b0010;
    
    #10;

    // Menor que B (Sin signo)
    A_tb = -32'h00000005;
    B_tb = 32'h00000005;
    ALUop_tb = 4'b0011;

    #10;

    $finish;
  end
endmodule
