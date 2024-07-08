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
    
    assign ld_mac=(x==col_x*row_x)?1'b1:1'b0;    
    assign clear_mac=~ld_mac;
    
    
    wire[3:0] w_mem[8:0];
    wire[3:0] x_mem[8:0];
    
       
    reg[3:0] x=4'd0;
    reg[3:0] w=4'd0;
    reg[3:0] w_unload=0;
    reg[3:0] x_unload=0;

    
    wire[3:0] w_temp,x_temp,w_unload_temp,x_unload_temp;
        
    mux_2X1 m1(w_temp,w+4'd1,w,w<col_w*row_w,clk);
    mux_2X1 m2(x_temp,x+4'd1,x,w==col_w*row_w && x<col_x*row_x,clk);
    
    always@(w_temp)
        w=w_temp;
    always@(x_temp)
        x=x_temp;
    
    assign w_mem[0]=clear_mem?4'd0:w==0?data_in:w_mem[0];
    assign w_mem[1]=clear_mem?4'd0:w==1?data_in:w_mem[1];
    assign w_mem[2]=clear_mem?4'd0:w==2?data_in:w_mem[2];
    assign w_mem[3]=clear_mem?4'd0:w==3?data_in:w_mem[3];
    assign w_mem[4]=clear_mem?4'd0:w==4?data_in:w_mem[4];
    assign w_mem[5]=clear_mem?4'd0:w==5?data_in:w_mem[5];
    assign w_mem[6]=clear_mem?4'd0:w==6?data_in:w_mem[6];
    assign w_mem[7]=clear_mem?4'd0:w==7?data_in:w_mem[7];
    assign w_mem[8]=clear_mem?4'd0:w==8?data_in:w_mem[8];
    
    assign x_mem[0]=clear_mem?4'd0:(w==row_w*col_w)&&(x==0)?data_in:x_mem[0];
    assign x_mem[1]=clear_mem?4'd0:(w==row_w*col_w)&&(x==1)?data_in:x_mem[1];
    assign x_mem[2]=clear_mem?4'd0:(w==row_w*col_w)&&(x==2)?data_in:x_mem[2];
    assign x_mem[3]=clear_mem?4'd0:(w==row_w*col_w)&&(x==3)?data_in:x_mem[3];
    assign x_mem[4]=clear_mem?4'd0:(w==row_w*col_w)&&(x==4)?data_in:x_mem[4];
    assign x_mem[5]=clear_mem?4'd0:(w==row_w*col_w)&&(x==5)?data_in:x_mem[5];
    assign x_mem[6]=clear_mem?4'd0:(w==row_w*col_w)&&(x==6)?data_in:x_mem[6];
    assign x_mem[7]=clear_mem?4'd0:(w==row_w*col_w)&&(x==7)?data_in:x_mem[7];
    assign x_mem[8]=clear_mem?4'd0:(w==row_w*col_w)&&(x==8)?data_in:x_mem[8];

    
    assign {data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3}=(x==col_x*row_x)&& (w_unload<col_w)?{w_mem[w_unload],w_mem[w_unload+col_w],w_mem[w_unload+2*col_w],x_mem[x_unload],x_mem[x_unload+1],x_mem[x_unload+2]}:24'd0;
    
    mux_2X1 m3(w_unload_temp,w_unload+4'd1,w_unload,(x==col_x*row_x)&& (w_unload<col_w),clk);
    mux_2X1 m4(x_unload_temp,x_unload+col_x,x_unload,(x==col_x*row_x)&& (w_unload<col_w),clk);
    
    always@(w_unload_temp)
        w_unload=w_unload_temp;
    always@(x_unload_temp)
        x_unload=x_unload_temp;  
        
          
endmodule

