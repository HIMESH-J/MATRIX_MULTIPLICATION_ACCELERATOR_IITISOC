module MAC(w,x,o,clk,load,clear);
  input[3:0]w,x;                               // 4-bit input values which have to be multiplied and accumulated
  input clk;                                   // clock input
  input clear;                                 // clear signal to clear the accumulator
  input load;                                  // load signal to load the accumulator
  wire[7:0] mulw;                              // wire for output of multiplier module. multiplication of two 4-bit values will result in an 8-bit output 
  output [9:0] o;                              // output of MAC. maximum bit size of output  for our design can be 10-bits(15X15+15X15+15X15)
  accumulator A(mulw,o,clear,clk,load);        // accumuluator module defined below is instantiated
  multiplier M(w,x,mulw);                      // a 4-bit multiplier is instantiated
endmodule  



module accumulator(x,y,clr,clk,ld);
  input[7:0] x;                          //input value to be accumulated
  output reg[9:0] y;                     //output for accumulated value
  wire[9:0] y_temp;                      // intermediate wire required for mux_mac module
  input clr,clk,ld;                      // clear, clock and load input signals
  mux_mac mux(y_temp,y,x,clr,ld);        // mux_mac module instantiated to accumulate the value only if load signal is high,and if clear is high then outputs 0
  always@(posedge clk)
    y=y_temp;              // accumulating the value at every positive edge of clock
 endmodule


