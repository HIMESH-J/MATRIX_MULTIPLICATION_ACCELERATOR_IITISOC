`timescale 1ns / 1ps
//`include"mem_bank.v"
module mem_bank_test();
    reg [3:0] data_in;
    reg clk;
    reg load_w,load_x;
    reg clear;
    
    initial
        clk=1'b0;
    always #5 clk=~clk;    
    memory_bank m(data_in,load_w,load_x,clear,clk);
    initial
        begin
          load_w<=0;load_x<=0;clear<=1;
        end
    initial
        begin
          #1  data_in=4'b0001;clear=0;load_w=1;
          #10 data_in=4'b0011;
          #10 data_in=4'b0001;
          #10 data_in=4'b0101;
          #10 data_in=4'b0001;
          #10 data_in=4'b1001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;load_w=0;load_x=1;
          #10 data_in=4'b0001;
          #10 data_in=4'b0101;
          #10 data_in=4'b0000;
          #10 data_in=4'b0001;
          #10 data_in=4'b1001;
          #10 data_in=4'b0001;
          #10 data_in=4'b1111;
          #10 data_in=4'b1011;
          #6 load_x=0;
          
        end 
    initial
        begin
       #900 $display("\n    %d %d %d",m.w_mem[0],m.w_mem[1],m.w_mem[2],
                   "\n    %d %d %d",m.w_mem[3],m.w_mem[4],m.w_mem[5],
                   "\n    %d %d %d",m.w_mem[6],m.w_mem[7],m.w_mem[8]);
            $display("\n    %d %d %d",m.x_mem[0],m.x_mem[1],m.x_mem[2],
                  "\n    %d %d %d",m.x_mem[3],m.x_mem[4],m.x_mem[5],
                  "\n    %d %d %d",m.x_mem[6],m.x_mem[7],m.x_mem[8]); 
        end
    initial
        #1000 $finish;

endmodule    
