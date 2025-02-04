module Tx_tb;

  initial begin
    $dumpfile("Tx_tb.vcd");
    $dumpvars(0);
  end
  
  reg resetn = 1;
  
  initial begin
    #10 resetn = 0;
    #10 resetn = 1;
    #30000 $finish;
  end
  
  reg clk = 0;
  
  always #1 clk = !clk;
  
  reg send = 0;
  reg [7:0] data = 0;
  reg [3:0] data_length = 0;
  reg [1:0] parity_type = 0;
  reg [1:0] baud_rate = 2'bxx;
  
  parameter EVEN = 0, ODD = 1, NOPARITY = 2;
  
  initial begin
    
    //test parity types
    data_length = 8;
    
    //EVEN
    #30
    parity_type = EVEN;
    data = 8'h81;
    #2 send = 1;
    #4 send = 0;
    
    #50
    data = 8'h83;
    #2 send = 1;
    #4 send = 0;
    
    //ODD
    #50
    parity_type = ODD;
    data = 8'h81;
    #2 send = 1;
    #4 send = 0;
    #50
    data = 8'h83;
    #2 send = 1;
    #4 send = 0;
    
    //NO PARITY BIT
    #50
    parity_type = NOPARITY;
    data = 8'h01;
    #2 send = 1;
    #4 send = 0;
    #50
    data = 8'h03;
    #2 send = 1;
    #4 send = 0;
    
    //test data lengths
    data = 8'h00;
    parity_type = NOPARITY;
    
    #50
    data_length = 5;
    #2 send = 1;
    #4 send = 0;
    
    #50
    data_length = 6;
    #2 send = 1;
    #4 send = 0;
    
    #50
    data_length = 7;
    #2 send = 1;
    #4 send = 0;
    
    #50
    data_length = 8;
    #2 send = 1;
    #4 send = 0;
    
    //reset interrupt test
    #50
    data_length = 8;
    parity_type = EVEN;
    data = 8'h00;
    #2 send = 1;
    #4 send = 0;
    #4 resetn = 0;
    #10 resetn = 1;
    
    //test baud rates
    #10 resetn = 0;
    #100 resetn = 1;
    
    //test baud 48
    baud_rate = 0;
    #8000
    resetn = 0;
    
    //test baud 96
    baud_rate = 1;
    #10 resetn = 1;
    #4000
    resetn = 0;
    
    //test baud 19.2
    baud_rate = 2;
    #10 resetn = 1;
    #2000
    resetn = 0;
    
    //test baud 348
    baud_rate = 3;
    #10 resetn = 1;
    #1000
    resetn = 0;
    #10 resetn = 1;
    
    
    
    
  end
  
  wire serial_data_out;
  
  Tx tx1(.resetn(resetn), .clk(clk), .send(send), .data(data), .data_length(data_length), .parity_type(parity_type), .baud_rate(baud_rate), .serial_data_out(serial_data_out));
  
endmodule
  
  