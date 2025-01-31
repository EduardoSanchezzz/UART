module ParityGen_tb;

  reg resetn = 0;
  initial begin
     $dumpfile("ParityGen_tb.vcd");
    $dumpvars(0);

     # 17 resetn = 0;
     # 11 resetn = 1;
     # 29 resetn = 0;
     # 5  resetn =1;
     # 100 $finish;
  end

  reg clk = 0;
  reg p_type = 0;
  reg [7:0] data = 0;
  always #1 clk = !clk;
  always #1 data = data + 1;
  always #16 p_type = !p_type;

  wire p_bit;
  ParityGen p1(resetn, p_type, data, p_bit);

  initial
    $monitor("At time %t, data = %b (%0d), p_bit = %b",
              $time, data, data, p_bit);
endmodule