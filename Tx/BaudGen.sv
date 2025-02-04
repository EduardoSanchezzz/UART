module BaudGen(
  input wire resetn,
  input wire clk,
  input wire [1:0] baud_rate,
  output reg baud_clk);
  
  reg [12:0] count;
  
  parameter BAUD48 = 0, BAUD96 = 1, BAUD192 = 2, BAUD384 = 3;
  
  
  reg [12:0] limit;
  
  always @(*) begin
    case(baud_rate)
      BAUD48: limit = 7500;
      BAUD96: limit = 3750;
      BAUD192: limit = 1875;
      BAUD384: limit = 937;
      default: limit = 0;
    endcase
  end
  
  always @(negedge resetn, posedge clk) begin
    if (!resetn || count == limit) count <= 0;
    else count <= count + 1;
  end
  
  assign baud_clk = count == 0;
  
endmodule