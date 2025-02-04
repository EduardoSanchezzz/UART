module BaudGen(
  input wire resetn,
  input wire clk,
  input wire [1:0] baud_rate,
  output reg baud_clk);
  
  reg [12:0] count;
  
  parameter BAUD48 = 0, BAUD96 = 1, BAUD192 = 2, BAUD384 = 3;
  
  
  reg [12:0] limit = 0;
  
  always @(*) begin
    case(baud_rate)
      BAUD48: limit = 3750;
      BAUD96: limit = 1875;
      BAUD192: limit = 937;
      BAUD384: limit = 469;
    endcase
  end
  
  always @(negedge resetn, posedge clk) begin
    if (!resetn) begin 
      count <= 0;
      baud_clk <= 0;
    end
    else if (count == limit) begin
      count <= 0;
      baud_clk <= !baud_clk;
    end
    else count <= count + 1;
  end
  
endmodule
  