module mem_bank(data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3,ld_mac,clear_mac,unload_res,
                data_in,clear_mem,row_w,row_x,col_w,col_x,
                clk);
    output [3:0] data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3;
    output  ld_mac;
    output clear_mac;
    output unload_res;
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
    
    equality_checker check(ld_mac,x,count_x);    
    not(clear_mac,ld_mac);

    
    wire[3:0] w_temp,x_temp,w_unload_temp,x_unload_temp;
    wire select_ldw,select_ldx,select_ldx_temp,select_ldwdash,select_ldxdash;
    
    comparator_greater_than comp1(select_ldw,count_w,w);
    comparator_greater_than comp2(select_ldx_temp,count_x,x);    
    not(select_ldwdash,select_ldw);
    not(select_ldxdash,select_ldx);
    and(select_ldx,select_ldx_temp,select_ldwdash);
        
    mux_2X1 m1(w_temp,w+4'd1,w,select_ldw);
    mux_2X1 m2(x_temp,x+4'd1,x,select_ldx);
    
    
    wire[3:0] temp_x[8:0];
    wire[3:0] temp_w[8:0];
    
    always@(posedge clk)
        w=w_temp;
    always@(posedge clk)
        x=x_temp;    
    
    wire load_w0;
    equality_checker w0(load_w0,w,4'd0);
    mux_4X1 memw0(w_mem[0],data_in,w_mem[0],clear_mem,load_w0);
    
    wire load_w1;
    equality_checker w1(load_w1,w,4'd1);   
    mux_4X1 memw1(w_mem[1],data_in,w_mem[1],clear_mem,load_w1);
    
    wire load_w2;
    equality_checker w2(load_w2,w,4'd2);
    mux_4X1 memw2(w_mem[2],data_in,w_mem[2],clear_mem,load_w2);
    
    wire load_w3;
    equality_checker w3(load_w3,w,4'd3);
    mux_4X1 memw3(w_mem[3],data_in,w_mem[3],clear_mem,load_w3);
    
    wire load_w4;
    equality_checker w4(load_w4,w,4'd4);
    mux_4X1 memw4(w_mem[4],data_in,w_mem[4],clear_mem,load_w4);
    
    wire load_w5;
    equality_checker w5(load_w5,w,4'd5);
    mux_4X1 memw5(w_mem[5],data_in,w_mem[5],clear_mem,load_w5);
    
    wire load_w6;
    equality_checker w6(load_w6,w,4'd6);
    mux_4X1 memw6(w_mem[6],data_in,w_mem[6],clear_mem,load_w6);
    
    wire load_w7;
    equality_checker w7(load_w7,w,4'd7);
    mux_4X1 memw7(w_mem[7],data_in,w_mem[7],clear_mem,load_w7);
    
    wire load_w8;
    equality_checker w8(load_w8,w,4'd8);
    mux_4X1 memw8(w_mem[8],data_in,w_mem[8],clear_mem,load_w8);
            
    wire load_x0;
    equality_checker x0(load_x0,x,4'd0);    
    mux_4X1 memx0(x_mem[0],data_in,x_mem[0],clear_mem,load_x0);
    
    wire load_x1;
    equality_checker x1(load_x1,x,4'd1);    
    mux_4X1 memx1(x_mem[1],data_in,x_mem[1],clear_mem,load_x1);
    
    wire load_x2;
    equality_checker x2(load_x2,x,4'd2);    
    mux_4X1 memx2(x_mem[2],data_in,x_mem[2],clear_mem,load_x2);
    
    wire load_x3;
    equality_checker x3(load_x3,x,4'd3);    
    mux_4X1 memx3(x_mem[3],data_in,x_mem[3],clear_mem,load_x3);
    
    wire load_x4;
    equality_checker x4(load_x4,x,4'd4);    
    mux_4X1 memx4(x_mem[4],data_in,x_mem[4],clear_mem,load_x4);
    
    wire load_x5;
    equality_checker x5(load_x5,x,4'd5);    
    mux_4X1 memx5(x_mem[5],data_in,x_mem[5],clear_mem,load_x5);
    
    wire load_x6;
    equality_checker x6(load_x6,x,4'd6);    
    mux_4X1 memx6(x_mem[6],data_in,x_mem[6],clear_mem,load_x6);
    
    wire load_x7;
    equality_checker x7(load_x7,x,4'd7);    
    mux_4X1 memx7(x_mem[7],data_in,x_mem[7],clear_mem,load_x7);
    
    wire load_x8;
    equality_checker x8(load_x8,x,4'd8);    
    mux_4X1 memx8(x_mem[8],data_in,x_mem[8],clear_mem,load_x8);
    
    wire select_unload_temp1,select_unload_temp2,select_unload;
    equality_checker eq(select_unload_temp1,x,count_x);    
    comparator_greater_than g(select_unload_temp2,{2'd0,col_w},w_unload); 
    and(select_unload,select_unload_temp1,select_unload_temp2);   
    
    wire[3:0] w_unload_plus_1,x_unload_plus_col_x;
    adder_4bit add1(w_unload_plus_1,w_unload,4'd1);
    adder_4bit add2(x_unload_plus_col_x,x_unload,{2'd0,col_x});
    mux_2X1_mem m3(w_unload_temp,w_unload_plus_1,w_unload,select_unload);
    mux_2X1_mem m4(x_unload_temp,x_unload_plus_col_x,x_unload,select_unload);
    
    wire[3:0] w_unload_plus_col_w,w_unload_plus_2col_w;
    adder_4bit add3(w_unload_plus_col_w,w_unload,{2'd0,col_w});
    
    adder_4bit add4(w_unload_plus_2col_w,w_unload_plus_col_w,{2'd0,col_w});
    mux_2X1_mem  mux_dataoutw1(data_outw1,w_mem[w_unload],4'd0,select_unload);
    mux_2X1_mem  mux_dataoutw2(data_outw2,w_mem[w_unload_plus_col_w],4'd0,select_unload);
    mux_2X1_mem  mux_dataoutw3(data_outw3,w_mem[w_unload_plus_2col_w],4'd0,select_unload);
    mux_2X1_mem  mux_dataoutx1(data_outx1,x_mem[x_unload],4'd0,select_unload);
    mux_2X1_mem  mux_dataoutx2(data_outx2,x_mem[x_unload+1],4'd0,select_unload);
    mux_2X1_mem  mux_dataoutx3(data_outx3,x_mem[x_unload+2],4'd0,select_unload);
    
    always@(posedge clk)
        w_unload=w_unload_temp;
    always@(posedge clk)
        x_unload=x_unload_temp;  
    
    equality_checker done_check(unload_res,w_unload,{2'd0,col_w});    
          
endmodule

