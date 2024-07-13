module datapath(data_out,data_in,clk,clear_mem,row_w,row_x,col_w,col_x);
    input[3:0] data_in;
    input clk;
    output[9:0] data_out;
    
    input clear_mem;
    input [1:0] row_w,row_x,col_w,col_x;
    
    wire[3:0] data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3;
    wire ld_mac,clear_mac,unload_res;
    mem_bank b(data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3,ld_mac,clear_mac,unload_res,
                data_in,clear_mem,row_w,row_x,col_w,col_x,
                clk);
    matrix_multiplier m(data_out,data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3,clk,ld_mac,clear_mac,unload_res);        


    endmodule
