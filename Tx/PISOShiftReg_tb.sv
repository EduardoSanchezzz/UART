module PISOShiftReg_tb;
  reg resetn = 1;
  
  initial begin
    $dumpfile("PISOShiftReg_tb.vcd");
    $dumpvars(0);
    
    #10 resetn = 0;
    #10 resetn = 1;
    #100 resetn = 0;
    #10 resetn = 1;
    #150 $finish;
  end
  
  reg baud_clk = 0;
  reg [7:0] data = 8'b0;
  reg send = 0;
  reg parity_bit = 0;
  reg [1:0] parity_type = 0;
  reg [3:0] data_length = 0;
  
  always #1 baud_clk = !baud_clk;
  
  initial begin
    #50
    data_length = 8;
    parity_type = 1;
    data = 8'b10001000;
    parity_bit = 1;
    #2 send = 1;
    #2 send = 0;
    
    //reset interrupt
    #50 
    data_length = 8;
    parity_type = 1;
    data = 8'b00110001;
    parity_bit = 0;
    #2 send = 1;
    #2 send = 0;
    
    #30
    data_length = 8;
    parity_type = 1;
    data = 8'b01001000;
    parity_bit = 1;
    #2 send = 1;
    #2 send = 0;
    
    #30
    data_length = 5;
    parity_type = 1;
    data = 8'b01001000;
    parity_bit = 0;
    #2 send = 1;
    #2 send = 0;
    
    #30
    data_length = 7;
    parity_type = 2;
    data = 8'b01001000;
    parity_bit = 0;
    #2 send = 1;
    #2 send = 0;
  end
  
  wire serial_data_out;
  PISOShiftReg piso1(.resetn(resetn), .send(send), .data(data), .parity_bit(parity_bit), .baud_clk(baud_clk), .data_length(data_length), .parity_type(parity_type), .serial_data_out(serial_data_out));
  
  initial $monitor();
  
endmodule