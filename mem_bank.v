`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 11:42:08
// Design Name: 
// Module Name: memory_bank
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module memory_bank(data_in,load_w,load_x,clear,clk);
    input[3:0] data_in;
    input load_w,load_x;
    input clear;
    input clk;
    reg[3:0] w_mem[8:0];
    reg[3:0] x_mem[8:0];
    integer x=0;
    integer w=0;
    integer i;
    always@( posedge clk)
         begin
            if(load_w)
                begin
                w_mem[w]=data_in;
                w=w+1;
                end
            else if(load_x)
                begin
                x_mem[x]=data_in;
                x=x+1; 
                end   
         end
     always@(posedge clear)
        begin
            if(clear)
            begin
                for(i=0;i<9;i=i+1)
                    begin
                    w_mem[i]<=4'b0;
                    x_mem[i]<=4'b0;
                    end
            end        
                
        end      
     
endmodule
