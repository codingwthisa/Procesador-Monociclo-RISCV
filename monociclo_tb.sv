module monociclo_tb;
    logic clk_tb;

    monociclo monociclo_inst(
        .clk(clk_tb)
    );

always #5 clk_tb = ~clk_tb;
  
initial begin
    $dumpfile("monociclo_tb.vcd");
    $dumpvars(0, monociclo_tb);

    clk_tb = 1;

    #200 $finish; 
end

endmodule