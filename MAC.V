`timescale 10ns/1ns
`include "multiplier.v"
module accumulator(x,y,clr,clk,ld);
  input[7:0] x;
  output reg[7:0] y;
  input clr,clk,ld;
  
    
  always@(negedge (clk))
    begin
       if(clr)y<=8'b00000000;
       else if(ld) y<=y+x;
    end    
endmodule

module MAC(w,x,o,clk,load,clear);
  input[3:0]w,x;
  input clk;
  input clear;
  input load;
  wire[7:0] mulw;
  
  
  reg [7:0]mul;
  output [7:0] o;
  
  accumulator A(mul,o,clear,clk,load);
  multiplier M(w,x,mulw);  
   initial
    mul<=0; 
  always@(posedge clk)
    begin
      mul<=mulw;
    end
  always@(posedge clk)
   begin
    data_w<=w;
    data_x<=x;
   end 

endmodule    
