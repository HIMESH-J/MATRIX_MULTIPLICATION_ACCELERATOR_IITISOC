`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2024 13:27:28
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg[3:0] data_in;
    reg clk=1'b0,clear=1'b0;
    reg[8:0] load_mac;
    reg[1:0] col_w,row_w;
    reg[1:0] col_x,row_x;
    
    
    initial
        clk=1'b0;
        
    always #5 clk=~clk;
    matmul m(data_in,clk,load_mac,clear,col_w,row_w,col_x,row_x);
    initial
        begin
            load_mac=9'd0;clear=1'b1;
        end
  
        
        /*  test set 1 3X3
          initial
                begin
            #1 clear=1'b0;col_w=2'd3;col_x=2'd3;row_w=2'd3;row_x=2'd3;
               data_in=4'd15;
           #10 data_in=4'd2;
           #10 data_in=4'd1;
           #10 data_in=4'd0;
           #10 data_in=4'd1;
           #10 data_in=4'd2;
           #10 data_in=4'd3;
           #10 data_in=4'd4;
           #10 data_in=4'd5;
           #10 data_in=4'd6;
           #10 data_in=4'd7;
           #10 data_in=4'd8;
           #10 data_in=4'd9;
           #10 data_in=4'd10;
           #10 data_in=4'd10;
           #10 data_in=4'd10;
           #10 data_in=4'd1;
           #10 data_in=4'd0;
           load_mac=9'b111111111;
            
            initial
            $monitor($time," \n    %d %d %d",m.o11,m.o12,m.o13,
                   "\n    %d %d %d",m.o21,m.o22,m.o23,
                   "\n    %d %d %d ",m.o31,m.o32,m.o33);
    //initial 
      //  $monitor($time," %d",m.data_x1);           
                     
          // initial
            //    $monitor($time," %d ",d.b.x_mem[5]);
        initial
            #500 $display(" \n    %d %d %d",m.data_w[0],m.data_w[1],m.data_w[2],
                   "\n    %d %d %d",m.data_w[3],m.data_w[4],m.data_w[5],
                   "\n    %d %d %d ",m.data_w[6],m.data_w[7],m.data_w[8]);
        initial
            #500 $display(" \n    %d %d %d",m.data_x[0],m.data_x[3],m.data_x[6],
                   "\n    %d %d %d",m.data_x[1],m.data_x[4],m.data_x[7],
                   "\n    %d %d %d ",m.data_x[2],m.data_x[5],m.data_x[8]);         

           */
          //test set 2X2
          
         /*
        initial
            begin
           #1 clear=1'b0;col_w=2'd2;col_x=2'd2;row_w=2'd2;row_x=2'd2;  
            data_in=4'd1;
        #10 data_in=4'd2;
        #10 data_in=4'd3;
        #10 data_in=4'd10;
        #10 data_in=4'd10;
        #10 data_in=4'd10;
        #10 data_in=4'd11;
        #10 data_in=4'd15;  load_mac=9'b000011011;
         end
        
        initial
            $monitor($time," \n    %d %d ",m.o11,m.o12,
                   "\n    %d %d ",m.o21,m.o22);
          initial
            #500 $display(" \n    %d %d ",m.data_w[0],m.data_w[1],
                   "\n    %d %d ",m.data_w[2],m.data_w[3]);         
          initial
            #500 $display(" \n    %d %d ",m.data_x[0],m.data_x[2],
                   "\n    %d %d ",m.data_x[1],m.data_x[3]);    */
                   
                   
           // test set 1X1
           
           /*
            initial 
                begin
            #1 clear=1'b0;col_w=2'd1;col_x=2'd1;row_w=2'd1;row_x=2'd1;
               data_in=4'd10;   
            #10 data_in=4'd2; load_mac=9'b000000001;                            
               
           end 
           initial
            $monitor($time," \n    %d  ",m.o11);
            initial
            #500 $display(" \n    %d ",m.data_w[0]);
            initial
            #500 $display(" \n    %d ",m.data_x[0]);  */   
          // test set 3X2 and 2X3;
            
          /*
               initial   
                begin
            #1 clear=1'b0;col_w=2'd2;col_x=2'd3;row_w=2'd3;row_x=2'd2;
               data_in=4'd10;
               #10 data_in=4'd2;
               #10 data_in=4'd1;
               #10 data_in=4'd2;
               #10 data_in=4'd3;
               #10 data_in=4'd5;
               #10 data_in=4'd2;
               #10 data_in=4'd8;
               #10 data_in=4'd9;
               #10 data_in=4'd1;
               #10 data_in=4'd4;
               #10 data_in=4'd5; load_mac=9'b111111111;
          
          end  
          initial
            $monitor($time," \n    %d %d %d",m.o11,m.o12,m.o13,
                   "\n    %d %d %d",m.o21,m.o22,m.o23,
                   "\n    %d %d %d ",m.o31,m.o32,m.o33);  
          initial
            #500 $display(" \n    %d %d ",m.data_w[0],m.data_w[1],
                   "\n    %d %d ",m.data_w[2],m.data_w[3],
                   "\n    %d %d  ",m.data_w[4],m.data_w[5]);
            initial
            #500 $display(" \n    %d %d %d",m.data_x[0],m.data_x[2],m.data_x[4],
                   "\n    %d %d %d",m.data_x[1],m.data_x[3],m.data_x[5]);*/
                 
                   

    
        initial #10000 $finish;
    
endmodule
