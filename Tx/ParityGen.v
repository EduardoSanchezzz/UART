module ParityGen(
  input wire resetn, 
  input wire [1:0] parity_type, 
  input wire[7:0] data, 
  output reg parity_bit);
  
  parameter EVEN = 0, ODD = 1;

  assign parity_bit = !resetn ? 0 : parity_type == EVEN ? ^{data} : ~(^{data});
endmodule

