//`timescale 1ns / 1ps
//`include "MAC.v"
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


module matmul( data_w1,data_w2,data_w3,data_x1,data_x2,data_x3,clk,load,clear);

    input[3:0] data_w1,data_w2,data_w3,data_x1,data_x2,data_x3;
    input clk,load,clear;
    wire [9:0] o11,o12,o13,o21,o22,o23,o31,o32,o33;
    //reg clear;
    /*initial
    begin
        clear<=1'b1;
        #10 clear<=1'b0;
       end */   
    /*initial
        begin
            if(load)
                clear<=1'b0;
        end */
    MAC m11(data_w1,data_x1,o11,clk,load,clear);
    MAC m12(data_w2,data_x1,o21,clk,load,clear);
    MAC m13(data_w3,data_x1,o31,clk,load,clear);
    
    MAC m21(data_w1,data_x2,o12,clk,load,clear);
    MAC m22(data_w2,data_x2,o22,clk,load,clear);
    MAC m23(data_w3,data_x2,o32,clk,load,clear);
    
    MAC m31(data_w1,data_x3,o13,clk,load,clear);
    MAC m32(data_w2,data_x3,o23,clk,load,clear);
    MAC m33(data_w3,data_x3,o33,clk,load,clear);
    
    
endmodule

/*module testbench();
    reg[3:0] data_w1,data_w2,data_w3;
    reg[3:0] data_x1,data_x2,data_x3;
    reg clk;
    //wire[7:0] o11,o12,o13,o21,o22,o23,o31,o32,o33;
    reg load,clear;
    initial
        clk=1'b0;
    always #5 clk=~clk;
    initial
    begin
        clear<=1'b1;
        #10 clear<=1'b0;
    end
    matmul m(data_w1,data_w2,data_w3,data_x1,data_x2,data_x3,clk,load,clear);

    initial
        begin
          load<=1;
          #11data_w1=4'b0011;
          data_w2=4'b0011;
          data_w3=4'b0011;
          data_x1=4'b0011;
          data_x2=4'b0011;
          data_x3=4'b0011;
                   
          #11 data_w2=4'b0010;
           data_w1=4'b0010;
           data_w3=4'b0010;
           data_x1=4'b0010;
           data_x2=4'b0010;
           data_x3=4'b0010;
        
          #11 data_w1=4'b0011;
           data_w2=4'b0011;
           data_w3=4'b0011;
           data_x1=4'b0011;
           data_x2=4'b0011;
           data_x3=4'b0011;
          #11load=0;

        end
    initial
        begin
            $monitor("\n    %d %d %d",m.o11,m.o12,m.o13,
                   "\n    %d %d %d",m.o21,m.o22,m.o23,
                   "\n    %d %d %d",m.o31,m.o32,m.o33);
            //#100 $finish;  
          end     

    initial 
    #1000 $finish;  

endmodule */
