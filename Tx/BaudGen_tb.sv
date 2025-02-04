module BaudGen_tb;
  
  reg resetn = 1;
  
  initial begin
    $dumpfile("BaudGen_tb.vcd");
    $dumpvars(0);
    
    #10 resetn = 0;
    #10 resetn = 1;
    #1000 resetn = 0;
    #10 resetn = 1;
    #100000 $finish;
  end
  
  reg clk = 0;
  wire[1:0] baud_rate = 3;
  reg count;
  
  always #1 clk = !clk;
  
  
  wire baud_clk;
  BaudGen bg1(.resetn(resetn), .clk(clk), .baud_rate(baud_rate), .baud_clk(baud_clk));
  
  initial
    //$monitor("at time %t, clk = %b, baud_clk = %b", $time, clk, baud_clk);
  $monitor("baud_clk = %b", baud_clk);
endmodule
  