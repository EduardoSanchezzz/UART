module Tx(
  input wire resetn,
  input wire clk,
  input wire send,
  input wire [7:0] data,
  input wire [3:0] data_length,
  input wire [1:0] parity_type,
  input wire [1:0] baud_rate,
  output reg serial_data_out
);
  wire baud_clk;
  wire parity_bit;
  
  BaudGen bg(.clk(clk), .resetn(resetn), .baud_rate(baud_rate), .baud_clk(baud_clk));
  ParityGen pg(.resetn(resetn), .parity_type(parity_type), .data(data), .parity_bit(parity_bit));
  PISOShiftReg piso(.resetn(resetn), .send(send), .data(data), .parity_bit(parity_bit), .baud_clk(baud_clk), .data_length(data_length), .parity_type(parity_type), .serial_data_out(serial_data_out));
               
  
endmodule