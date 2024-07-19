module testbench();
    reg[3:0] data_in;                                                                    // Declaring data in register that stores temporarily elements of input matrices one at a time
    reg clk=1'b0; always#5 clk=~clk;                                                     // setting up clock
    
    reg clear_mem;                                                                       // register to store signal for clearing memory
    reg[1:0] row_w,row_x,col_w,col_x;                                                    // registers to store number columns and rows of input matrices
    wire[9:0] res;
    
    datapath d(res,data_in,clk,clear_mem,row_w,row_x,col_w,col_x);                       // instantiating our design and connecting the ports in order
    
    
    initial begin
      clear_mem=1'b1;                                                                   // firstly clearing the memory
    end
    initial begin
      #1 clear_mem=1'b0;                                                               // setting clear memory signal to low so that we can start loading values

         
        // loading input matrices. both the matrices are being loaded row-wise. Data values and no.of columns and rows can be modified as long as each value can be stored in 4-bits and matrices are of maximum size 3X3
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
         
    end
    // monitoring output at every negative edge of clock(negative edge because at every positive edge matrix multiplier module is giving one result 
     always@(negedge clk) 
         $display($time,"%d",res);    // row wise elements will be displayed
    initial 
        #240 $finish;    
        
        
 endmodule        
                        
