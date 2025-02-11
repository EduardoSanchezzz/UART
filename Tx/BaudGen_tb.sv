module BaudGen_tb;
  
  reg resetn = 1;
  
  initial begin
    $dumpfile("BaudGen_tb.vcd");
    $dumpvars(0);
    
    #10 resetn = 0;
    #10 resetn = 1;
    #30000 $finish;
  end
  
  reg clk = 0;
  reg [1:0] baud_rate = 2'bxx;
  
  always #1 clk = !clk;
  
  initial begin
    #20 baud_rate = 0;
  end
  
  wire baud_clk;
  BaudGen bg1(.resetn(resetn), .clk(clk), .baud_rate(baud_rate), .baud_clk(baud_clk));
  
endmodule
  
  