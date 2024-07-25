module testbench();
    reg[3:0] data_in;
    reg clk=1'b0; always#5 clk=~clk;
    
    reg clear_mem;
    reg[1:0] row_w,row_x,col_w,col_x;
    wire[9:0] res;
    datapath d(res,data_in,clk,clear_mem,row_w,row_x,col_w,col_x);
    
    
    initial begin
      clear_mem=1'b1;
    end
    initial begin
      #1 clear_mem=1'b0;
         row_w=2'd3;col_w=2'd2;row_x=2'd2;col_x=2'd3;
         data_in=4'd1;
    #10  data_in=4'd3;
    #10  data_in=4'd4;
    #10  data_in=4'd5;
    #10  data_in=4'd6;
    #10  data_in=4'd7;
    #10  data_in=4'd8;
    #10  data_in=4'd9;
    #10  data_in=4'd10;
    #10  data_in=4'd11;
    #10  data_in=4'd12;
    #10  data_in=4'd13;
         /*row_w=2'd1;col_w=2'd1;row_x=2'd1;col_x=2'd1;
         data_in=4'd10;
     #10 data_in=4'd15;*/
        /* row_w=2'd2;col_w=2'd2;row_x=2'd2;col_x=2'd2;
         data_in=4'd1;
     #10 data_in=4'd0;
     #10 data_in=4'd0;
     #10 data_in=4'd1;
     #10 data_in=4'd1;
     #10 data_in=4'd0;
     #10 data_in=4'd0;
     #10 data_in=4'd1;   */
    end
     always@(negedge clk) 
       $display($time,"%d",res);
      //initial   
       //$monitor($time," %d",d.m.i);
    initial 
       #240 $finish;    
        
        
 endmodule        
                        
