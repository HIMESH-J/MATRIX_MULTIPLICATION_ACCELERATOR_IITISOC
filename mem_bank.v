module mem_bank(data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3,ld_mac,clear_mac,
                data_in,clear_mem,row_w,row_x,col_w,col_x,
                clk);
    output reg[3:0] data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3;
    output  ld_mac;
    output clear_mac;
    input[3:0] data_in;
    input clear_mem;
    input [1:0] row_w,row_x,col_w,col_x;
    input clk;
    reg[3:0] w_mem[8:0];
    reg[3:0] x_mem[8:0];
    
    integer x=0;
    integer w=0;
    
    integer w_unload=0;
    integer x_unload=0;

    
    assign ld_mac=(x==col_x*row_x)?1'b1:1'b0;    
    assign clear_mac=~ld_mac;

    
    
    always@(posedge clear_mem)begin
            {w_mem[8],w_mem[7],w_mem[6],w_mem[5],w_mem[4],w_mem[3],w_mem[2],w_mem[1],w_mem[0]}=32'd0;
            {x_mem[8],x_mem[7],x_mem[6],x_mem[5],x_mem[4],x_mem[3],x_mem[2],x_mem[1],x_mem[0]}=32'd0;
        end
    always@(posedge clk)begin
      if(w<col_w*row_w)begin
        w_mem[w]=data_in;
        w=w+1;
      end
      else if(w==col_w*row_w && x<col_x*row_x)begin
        x_mem[x]=data_in;
        x=x+1;
      end
    end
    always@(negedge clk)begin
        if((x==col_x*row_x)&& (w_unload<col_w))begin
          {data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3}={w_mem[w_unload],w_mem[w_unload+col_w],w_mem[w_unload+2*col_w],x_mem[x_unload],x_mem[x_unload+1],x_mem[x_unload+2]};
          w_unload=w_unload+1;
          x_unload=x_unload+col_x;
        end  
        else {data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3}=24'd0;
    end
    
    endmodule

