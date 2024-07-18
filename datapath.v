module datapath(data_out,data_in,clk,clear_mem,row_w,row_x,col_w,col_x);
    input[3:0] data_in;                                                             // input value to be stored in input matrices
    input clk;                                                                      // clock input
    output[9:0] data_out;                                                           // data out output which will output all the results of output matrix one by one row-wise
    
    input clear_mem;                                                                // input passed on to memory bank module if we need to clear memory
    input [1:0] row_w,row_x,col_w,col_x;                                            // input value for no. of rows and columns of input matrices.
    
    wire[3:0] data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3;    // intermediate wires required to connect mem_bank and matrix_multiplier module
    wire[8:0] ld_mac,clear_mac;
    wire unload_res;

    //mem_bank module is instantiated
    mem_bank b(data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3,ld_mac,clear_mac,unload_res,    
                data_in,clear_mem,row_w,row_x,col_w,col_x,
                clk);
    
    //matrix_multiplier module is instantiated    
    matrix_multiplier m(data_out,data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3,clk,ld_mac,clear_mac,unload_res);        


    endmodule
