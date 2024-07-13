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
       /*  row_w=2'd2;col_w=2'd2;row_x=2'd2;col_x=2'd2;
         data_in=4'd1;
     #10 data_in=4'd0;
     #10 data_in=4'd0;
     #10 data_in=4'd1;
     #10 data_in=4'd1;
     #10 data_in=4'd0;
     #10 data_in=4'd0;
     #10 data_in=4'd1;  */ 
    end
     always@(negedge clk) 
        $display($time,"%d",res);
    /*initial
             $monitor($time,"\n %d %d %d ",d.m.o11,d.m.o12,d.m.o13,
                            " \n %d %d %d ",d.m.o21,d.m.o22,d.m.o23,
                            " \n %d %d %d ",d.m.o31,d.m.o32,d.m.o33);*/
                            
   /* initial
        $monitor($time," %d %b",d.b.w_unload,d.b.select_unload_temp2); */
    /*always@(posedge clk)begin
           if(counter<col_w&& counter_w<col_w*row_w&&!counter_x)begin
                $display("%d ",data_in);
                counter=counter+1;
                counter_w=counter_w+1;                
                end
           else if(!counter_x && counter==col_w  && counter_w<col_w*row_w )begin
            $display("\n %d ",data_in);
            counter=0;
            counter_w=counter_w+1;
           end
           else if(counter_w==col_w*row_w && counter<col_x &&counter_x<row_x*col_x)begin
                $display("%d ",data_in);
                counter=counter+1;
                counter_x=counter_x+1;                
                
           end
           else if(counter_w==col_w*row_w && counter==col_x && counter_x<row_x*col_x)begin
             $display("\n %d ",data_in);
            counter=0;
            counter_x=counter_x+1;
          
           end
        end*/
    initial 
        #240 $finish;    
        
        
 endmodule        
                        
