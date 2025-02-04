module PISOShiftReg(
  input wire resetn,
  input wire send,
  input wire [7:0] data,
  input wire parity_bit,
  input wire baud_clk,
  input wire [3:0] data_length,
  input wire [1:0] parity_type,
  output reg serial_data_out
);
  
  //state logic
  parameter IDLE = 0, START = 1, DATA = 2, PARITY = 3, STOP = 4;
  
  reg[2:0] state, next_state;
  reg [3:0] bit_count;
  reg [7:0] data_out;
  
  always @(*) begin
    case(state)
      IDLE: next_state = send ? START : IDLE;
      START: next_state = DATA;
      DATA: next_state = bit_count == data_length - 1 ? (parity_type != 2) ? PARITY : STOP : DATA;
      PARITY: next_state = STOP;
      STOP: next_state = IDLE;
    endcase
  end
  
  always @(posedge baud_clk, negedge resetn) begin
    if(!resetn) begin
      state = IDLE;
      bit_count <= 0;
      data_out <= data;
    end
    else begin
      if (state == DATA) begin
        bit_count <= bit_count + 1;
        data_out <= data_out >> 1;
      end
      if (state == START) begin
        data_out<= data;
        bit_count <= 0;
      end
      state <= next_state;
    end
  end
  
  always @(*) begin
    case(state)
      IDLE: serial_data_out = 1;
      START: serial_data_out = 0;
      DATA: serial_data_out = data_out[0];
      PARITY: serial_data_out = parity_bit;
      STOP: serial_data_out = 1;
    endcase
  end
  
endmodule