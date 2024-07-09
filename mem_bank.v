module mem_bank(data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3,ld_mac,clear_mac,
                data_in,clear_mem,row_w,row_x,col_w,col_x,
                clk);
    output [3:0] data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3;
    output  ld_mac;
    output clear_mac;
    input[3:0] data_in;
    input clear_mem;
    input [1:0] row_w,row_x,col_w,col_x;
    input clk;
    
    
    
    wire[3:0] w_mem[8:0];
    wire[3:0] x_mem[8:0];
    
       
    reg[3:0] x=4'd0;
    reg[3:0] w=4'd0;
    reg[3:0] w_unload=0;
    reg[3:0] x_unload=0;
    
    mux_2X1_1bit mux(ld_mac,1'b1,1'b0,x==col_x*row_x);
    not(clear_mac,ld_mac);

    
    wire[3:0] w_temp,x_temp,w_unload_temp,x_unload_temp;
        
    mux_2X1_4bit m1(w_temp,w+4'd1,w,w<col_w*row_w,clk);
    mux_2X1_4bit m2(x_temp,x+4'd1,x,w==col_w*row_w && x<col_x*row_x,clk);
    
    wire[3:0] temp_x[8:0];
    wire[3:0] temp_w[8:0];
    
    always@(w_temp)
        w=w_temp;
    always@(x_temp)
        x=x_temp;
    
    
    mux_2X1_mem mux_memw1(temp_w[0],data_in,w_mem[0],w==0);
    mux_2X1_mem mux_memw11(w_mem[0],4'd0,temp_w[0],clear_mem);
   
    mux_2X1_mem mux_memw2(temp_w[1],data_in,w_mem[1],w==1);
    mux_2X1_mem mux_memw22(w_mem[1],4'd0,temp_w[1],clear_mem);
   
    mux_2X1_mem mux_memw3(temp_w[2],data_in,w_mem[2],w==2);
    mux_2X1_mem mux_memw33(w_mem[2],4'd0,temp_w[2],clear_mem);
   
    mux_2X1_mem mux_memw4(temp_w[3],data_in,w_mem[3],w==3);
    mux_2X1_mem mux_memw44(w_mem[3],4'd0,temp_w[3],clear_mem);
   
    mux_2X1_mem mux_memw5(temp_w[4],data_in,w_mem[4],w==4);
    mux_2X1_mem mux_memw55(w_mem[4],4'd0,temp_w[4],clear_mem);
   
    mux_2X1_mem mux_memw6(temp_w[5],data_in,w_mem[5],w==5);
    mux_2X1_mem mux_memw66(w_mem[5],4'd0,temp_w[5],clear_mem);
    
    mux_2X1_mem mux_memw7(temp_w[6],data_in,w_mem[6],w==6);
    mux_2X1_mem mux_memw77(w_mem[6],4'd0,temp_w[6],clear_mem);   
   
    mux_2X1_mem mux_memw8(temp_w[7],data_in,w_mem[7],w==7);
    mux_2X1_mem mux_memw88(w_mem[7],4'd0,temp_w[7],clear_mem);   
   
    mux_2X1_mem mux_memw9(temp_w[8],data_in,w_mem[8],w==8);
    mux_2X1_mem mux_memw99(w_mem[8],4'd0,temp_w[8],clear_mem); 
    
            
    
    mux_2X1_mem mux_memx1(temp_x[0],data_in,x_mem[0],x==0);
    mux_2X1_mem mux_memx11(x_mem[0],4'd0,temp_x[0],clear_mem);
   
    mux_2X1_mem mux_memx2(temp_x[1],data_in,x_mem[1],x==1);
    mux_2X1_mem mux_memx22(x_mem[1],4'd0,temp_x[1],clear_mem);
   
    mux_2X1_mem mux_memx3(temp_x[2],data_in,x_mem[2],x==2);
    mux_2X1_mem mux_memx33(x_mem[2],4'd0,temp_x[2],clear_mem);
   
    mux_2X1_mem mux_memx4(temp_x[3],data_in,x_mem[3],x==3);
    mux_2X1_mem mux_memx44(x_mem[3],4'd0,temp_x[3],clear_mem);
   
    mux_2X1_mem mux_memx5(temp_x[4],data_in,x_mem[4],x==4);
    mux_2X1_mem mux_memx55(x_mem[4],4'd0,temp_x[4],clear_mem);
   
    mux_2X1_mem mux_memx6(temp_x[5],data_in,x_mem[5],x==5);
    mux_2X1_mem mux_memx66(x_mem[5],4'd0,temp_x[5],clear_mem);
    
    mux_2X1_mem mux_memx7(temp_x[6],data_in,x_mem[6],x==6);
    mux_2X1_mem mux_memx77(x_mem[6],4'd0,temp_x[6],clear_mem);   
   
    mux_2X1_mem mux_memx8(temp_x[7],data_in,x_mem[7],x==7);
    mux_2X1_mem mux_memx88(x_mem[7],4'd0,temp_x[7],clear_mem);   
   
    mux_2X1_mem mux_memx9(temp_x[8],data_in,x_mem[8],x==8);
    mux_2X1_mem mux_memx99(x_mem[8],4'd0,temp_x[8],clear_mem);
    
    
    mux_2X1_4bit m3(w_unload_temp,w_unload+4'd1,w_unload,(x==col_x*row_x)&& (w_unload<col_w),clk);
    mux_2X1_4bit m4(x_unload_temp,x_unload+col_x,x_unload,(x==col_x*row_x)&& (w_unload<col_w),clk);
    
    mux_2X1_mem  mux_dataoutw1(data_outw1,w_mem[w_unload],4'd0,(x==col_x*row_x)&& (w_unload<col_w));
    mux_2X1_mem  mux_dataoutw2(data_outw2,w_mem[w_unload+col_w],4'd0,(x==col_x*row_x)&& (w_unload<col_w));
    mux_2X1_mem  mux_dataoutw3(data_outw3,w_mem[w_unload+2*col_w],4'd0,(x==col_x*row_x)&& (w_unload<col_w));
    mux_2X1_mem  mux_dataoutx1(data_outx1,x_mem[x_unload],4'd0,(x==col_x*row_x)&& (w_unload<col_w));
    mux_2X1_mem  mux_dataoutx2(data_outx2,x_mem[w_unload+1],4'd0,(x==col_x*row_x)&& (w_unload<col_w));
    mux_2X1_mem  mux_dataoutx3(data_outx3,x_mem[w_unload+1],4'd0,(x==col_x*row_x)&& (w_unload<col_w));
    
    always@(w_unload_temp)
        w_unload=w_unload_temp;
    always@(x_unload_temp)
        x_unload=x_unload_temp;  
        
          
endmodule

