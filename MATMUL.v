`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 15:52:50
// Design Name: 
// Module Name: matmul
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


module matmul( data_in,clk,load,clear,col_w,row_w,col_x,row_x);
    input[3:0] data_in;
    input[1:0] col_w,row_w,col_x,row_x;
    reg[3:0] data_w[8:0],data_x[8:0];
    reg[3:0] data_w1,data_w2,data_w3,data_x1,data_x2,data_x3;
    input clk,clear;
    reg[8:0] load_mac=8'd0;
    input[8:0] load;
    integer w=0;integer x=0;
    integer i=0,j=0;
    reg[1:0] counter=3'd0;
    wire [9:0] o11,o12,o13,o21,o22,o23,o31,o32,o33;
    always@(posedge clk)
        begin
            if(w<col_w*row_w)begin
                data_w[w]=data_in;
                w=w+1;
                end
            else if(w==col_w*row_w&&x<col_x*row_x)begin
                data_x[x]=data_in;
                x=x+1;
                end    
        end
     always@(w,x)
        if(x==col_x*row_x)load_mac=load;   
    
    MAC m11(data_w1,data_x1,o11,clk,load_mac[0],clear);
    MAC m12(data_w2,data_x1,o21,clk,load_mac[1],clear);
    MAC m13(data_w3,data_x1,o31,clk,load_mac[2],clear);
    
    MAC m21(data_w1,data_x2,o12,clk,load_mac[3],clear);
    MAC m22(data_w2,data_x2,o22,clk,load_mac[4],clear);
    MAC m23(data_w3,data_x2,o32,clk,load_mac[5],clear);
    
    MAC m31(data_w1,data_x3,o13,clk,load_mac[6],clear);
    MAC m32(data_w2,data_x3,o23,clk,load_mac[7],clear);
    MAC m33(data_w3,data_x3,o33,clk,load_mac[8],clear);
    always@(posedge clk)begin
        if(w==col_w*row_w&&x==col_w*row_w&&i<col_w&&j<row_x)begin
            data_w1=data_w[i];
            data_w2=data_w[i+col_w];
            data_w3=data_w[i+2*col_w];
            data_x1=data_x[j];
            data_x2=data_x[j+row_x];
            data_x3=data_x[j+2*row_x];
            i=i+1;
            j=j+1;
            counter=counter+1;            
        
        end
        
            
    
    end   
    always@(negedge clk) 
        if(i>=col_w||j>=row_x)begin
            data_w1=4'd0;
            data_w2=4'd0;
            data_w3=4'd0;
            data_x1=4'd0;
            data_x2=4'd0;
            data_x3=4'd0;
        end   
        
    
endmodule

