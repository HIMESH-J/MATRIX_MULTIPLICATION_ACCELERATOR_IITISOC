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
    
    wire[3:0] count_x,count_w;
    
    multiplier_2bit mulx(count_x,row_x,col_x);
    multiplier_2bit mulw(count_w,row_w,col_w);
    
    wire[3:0] w_mem[8:0];
    wire[3:0] x_mem[8:0];
    
       
    reg[3:0] x=4'd0;
    reg[3:0] w=4'd0;
    reg[3:0] w_unload=0;
    reg[3:0] x_unload=0;
    
    mux_2X1_1bit mux(ld_mac,1'b1,1'b0,x==count_x);
    not(clear_mac,ld_mac);

    
    wire[3:0] w_temp,x_temp,w_unload_temp,x_unload_temp;
    wire select_ldw,select_ldx,select_ldx_temp,select_ldwdash,select_ldxdash;
    
    comparator_greater_than comp1(select_ldw,count_w,w);
    comparator_greater_than comp2(select_ldx_temp,count_x,x);
    
    not(select_ldwdash,select_ldw);
    not(select_ldxdash,select_ldx);
    and(select_ldx,select_ldx_temp,select_ldwdash);
        
    mux_2X1_4bit m1(w_temp,w+4'd1,w,select_ldw,clk);
    mux_2X1_4bit m2(x_temp,x+4'd1,x,select_ldx,clk);
    
    wire[3:0] temp_x[8:0];
    wire[3:0] temp_w[8:0];
    
    always@(w_temp)
        w=w_temp;
    always@(x_temp)
        x=x_temp;    
    
    wire load_w0;
    equality_checker w0(load_w0,w,4'd0);
    mux_2X1_mem mux_memw1(temp_w[0],data_in,w_mem[0],load_w0);
    mux_2X1_mem mux_memw11(w_mem[0],4'd0,temp_w[0],clear_mem);

    wire load_w1;
    equality_checker w1(load_w1,w,4'd1);   
    mux_2X1_mem mux_memw2(temp_w[1],data_in,w_mem[1],load_w1);
    mux_2X1_mem mux_memw22(w_mem[1],4'd0,temp_w[1],clear_mem);
   
    wire load_w2;
    equality_checker w2(load_w2,w,4'd2);
    mux_2X1_mem mux_memw3(temp_w[2],data_in,w_mem[2],load_w2);
    mux_2X1_mem mux_memw33(w_mem[2],4'd0,temp_w[2],clear_mem);
   
    wire load_w3;
    equality_checker w3(load_w3,w,4'd3);
    mux_2X1_mem mux_memw4(temp_w[3],data_in,w_mem[3],load_w3);
    mux_2X1_mem mux_memw44(w_mem[3],4'd0,temp_w[3],clear_mem);
   
    wire load_w4;
    equality_checker w4(load_w4,w,4'd4);
    mux_2X1_mem mux_memw5(temp_w[4],data_in,w_mem[4],load_w4);
    mux_2X1_mem mux_memw55(w_mem[4],4'd0,temp_w[4],clear_mem);
   
    wire load_w5;
    equality_checker w5(load_w5,w,4'd5);
    mux_2X1_mem mux_memw6(temp_w[5],data_in,w_mem[5],load_w5);
    mux_2X1_mem mux_memw66(w_mem[5],4'd0,temp_w[5],clear_mem);
    
    wire load_w6;
    equality_checker w6(load_w6,w,4'd6);
    mux_2X1_mem mux_memw7(temp_w[6],data_in,w_mem[6],load_w6);
    mux_2X1_mem mux_memw77(w_mem[6],4'd0,temp_w[6],clear_mem);   
   
    wire load_w7;
    equality_checker w7(load_w7,w,4'd7);
    mux_2X1_mem mux_memw8(temp_w[7],data_in,w_mem[7],load_w7);
    mux_2X1_mem mux_memw88(w_mem[7],4'd0,temp_w[7],clear_mem);   
   
    wire load_w8;
    equality_checker w8(load_w8,w,4'd8);
    mux_2X1_mem mux_memw9(temp_w[8],data_in,w_mem[8],load_w8);
    mux_2X1_mem mux_memw99(w_mem[8],4'd0,temp_w[8],clear_mem); 
    
            
    wire load_x0;
    equality_checker x0(load_x0,x,4'd0);    
    mux_2X1_mem mux_memx1(temp_x[0],data_in,x_mem[0],load_x0);
    mux_2X1_mem mux_memx11(x_mem[0],4'd0,temp_x[0],clear_mem);
   
    wire load_x1;
    equality_checker x1(load_x1,x,4'd1);    
    mux_2X1_mem mux_memx2(temp_x[1],data_in,x_mem[1],load_x1);
    mux_2X1_mem mux_memx22(x_mem[1],4'd0,temp_x[1],clear_mem);
   
    wire load_x2;
    equality_checker x2(load_x2,x,4'd2);    
    mux_2X1_mem mux_memx3(temp_x[2],data_in,x_mem[2],load_x2);
    mux_2X1_mem mux_memx33(x_mem[2],4'd0,temp_x[2],clear_mem);
   
    wire load_x3;
    equality_checker x3(load_x3,x,4'd3);    
    mux_2X1_mem mux_memx4(temp_x[3],data_in,x_mem[3],load_x3);
    mux_2X1_mem mux_memx44(x_mem[3],4'd0,temp_x[3],clear_mem);
   
    wire load_x4;
    equality_checker x4(load_x4,x,4'd4);    
    mux_2X1_mem mux_memx5(temp_x[4],data_in,x_mem[4],load_x4);
    mux_2X1_mem mux_memx55(x_mem[4],4'd0,temp_x[4],clear_mem);
   
    wire load_x5;
    equality_checker x5(load_x5,x,4'd5);    
    mux_2X1_mem mux_memx6(temp_x[5],data_in,x_mem[5],load_x5);
    mux_2X1_mem mux_memx66(x_mem[5],4'd0,temp_x[5],clear_mem);
    
    wire load_x6;
    equality_checker x6(load_x6,x,4'd6);    
    mux_2X1_mem mux_memx7(temp_x[6],data_in,x_mem[6],load_x6);
    mux_2X1_mem mux_memx77(x_mem[6],4'd0,temp_x[6],clear_mem);   
   
    wire load_x7;
    equality_checker x7(load_x7,x,4'd7);    
    mux_2X1_mem mux_memx8(temp_x[7],data_in,x_mem[7],load_x7);
    mux_2X1_mem mux_memx88(x_mem[7],4'd0,temp_x[7],clear_mem);   
   
    wire load_x8;
    equality_checker x8(load_x8,x,4'd8);    
    mux_2X1_mem mux_memx9(temp_x[8],data_in,x_mem[8],load_x8);
    mux_2X1_mem mux_memx99(x_mem[8],4'd0,temp_x[8],clear_mem);
    
    
    mux_2X1_4bit m3(w_unload_temp,w_unload+4'd1,w_unload,(x==count_x)&& (w_unload<col_w),clk);
    mux_2X1_4bit m4(x_unload_temp,x_unload+col_x,x_unload,(x==count_x)&& (w_unload<col_w),clk);
    
    mux_2X1_mem  mux_dataoutw1(data_outw1,w_mem[w_unload],4'd0,(x==count_x)&& (w_unload<col_w));
    mux_2X1_mem  mux_dataoutw2(data_outw2,w_mem[w_unload+col_w],4'd0,(x==count_x)&& (w_unload<col_w));
    mux_2X1_mem  mux_dataoutw3(data_outw3,w_mem[w_unload+2*col_w],4'd0,(x==count_x)&& (w_unload<col_w));
    mux_2X1_mem  mux_dataoutx1(data_outx1,x_mem[x_unload],4'd0,(x==count_x)&& (w_unload<col_w));
    mux_2X1_mem  mux_dataoutx2(data_outx2,x_mem[x_unload+1],4'd0,(x==count_x)&& (w_unload<col_w));
    mux_2X1_mem  mux_dataoutx3(data_outx3,x_mem[x_unload+2],4'd0,(x==count_x)&& (w_unload<col_w));
    
    always@(w_unload_temp)
        w_unload=w_unload_temp;
    always@(x_unload_temp)
        x_unload=x_unload_temp;  
        
          
endmodule

