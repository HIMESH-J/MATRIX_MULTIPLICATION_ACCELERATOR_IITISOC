//`timescale 1ns / 1ps
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


module memory_bank(data_in,load_w,load_x,
clear,clk,unload1,unload2,unload3,
start,data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3

);
    input[3:0] data_in;
    input load_w,load_x;
    input clear;
    input clk;
    //input[1:0] state;
    input unload1,unload2,unload3;
    output reg start;
    reg[3:0] w_mem[8:0];
    reg[3:0] x_mem[8:0];
    integer x=0;// for address of x
    integer w=0;// for address of w
    //integer i;
    output reg[3:0] data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3;
    wire x_lim,w_lim;
    parameter S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
    comparator_greater_than gtw(4'd9,w,w_lim);
    comparator_greater_than gtx(4'd9,x,x_lim);
    

    initial
        start<=1'b0;
        
    always@( posedge clk) // data writing
         begin
            if(load_w&& w_lim)
                begin
                w_mem[w]=data_in;
                w=w+1;
                end
            else if(load_x && x_lim)
                begin
                x_mem[x]=data_in;
                x=x+1; 
                end   
         end
     always@(posedge clear)
        
            if(clear)
            begin
               {w_mem[0],w_mem[1],w_mem[2],w_mem[3],w_mem[4],w_mem[5],w_mem[6],w_mem[7],w_mem[8]}=36'd0;
               {x_mem[0],x_mem[1],x_mem[2],x_mem[3],x_mem[4],x_mem[5],x_mem[6],x_mem[7],x_mem[8]}=36'd0;
            end        
                
        
        always@(x)
            begin
                if(x==8)
                     start<=1'b1;
            end
        always@(*)
            begin
              if(unload1)begin  data_outw1<=w_mem[0];data_outw2<=w_mem[3];data_outw3<=w_mem[6];data_outx1<=x_mem[0];data_outx2<=x_mem[1];data_outx3<=x_mem[2]; end
              else if(unload2)begin  data_outw1<=w_mem[1];data_outw2<=w_mem[4];data_outw3<=w_mem[7];data_outx1<=x_mem[3];data_outx2<=x_mem[4];data_outx3<=x_mem[5]; end
              else if(unload3)begin  data_outw1<=w_mem[2];data_outw2<=w_mem[5];data_outw3<=w_mem[8];data_outx1<=x_mem[6];data_outx2<=x_mem[7];data_outx3<=x_mem[8]; end
              else begin  data_outw1<=4'b0;data_outw2<=4'b0;data_outw3<=4'b0;data_outx1<=4'b0;data_outx2<=4'b0;data_outx3<=4'b0; end
            end    
           
            
     
endmodule
