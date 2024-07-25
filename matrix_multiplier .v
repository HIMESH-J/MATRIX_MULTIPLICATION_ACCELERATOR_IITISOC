//This Verilog code defines a module matmul that performs matrix multiplication using instances of the MAC (Multiply-Accumulate) module. 


module matrix_multiplier( data_out,data_w1,data_w2,data_w3,data_x1,data_x2,data_x3,clk,load,clear,unload_res);
    
    output [9:0] data_out;
    input[3:0] data_w1,data_w2,data_w3,data_x1,data_x2,data_x3;
    input clk;
    input [8:0] load,clear;
    input unload_res;
    
    wire[9:0] res[8:0];
    
    MAC m11(data_w1,data_x1,res[0],clk,load[0],clear[0]);
    MAC m12(data_w1,data_x2,res[1],clk,load[1],clear[1]);
    MAC m13(data_w1,data_x3,res[2],clk,load[2],clear[2]);
    
    MAC m21(data_w2,data_x1,res[3],clk,load[3],clear[3]);
    MAC m22(data_w2,data_x2,res[4],clk,load[4],clear[4]);
    MAC m23(data_w2,data_x3,res[5],clk,load[5],clear[5]);
    
    MAC m31(data_w3,data_x1,res[6],clk,load[6],clear[6]);   
    MAC m32(data_w3,data_x2,res[7],clk,load[7],clear[7]);    
    MAC m33(data_w3,data_x3,res[8],clk,load[8],clear[8]);
    
    wire select_unload;
    wire i_less_than_9;
    wire[3:0] i_temp;    
    wire[3:0] i;
    wire notclk;
    not(notclk,clk);
    comparator_greater_than comp_i(i_less_than_9,4'd9,i);
    and(select_unload,i_less_than_9,unload_res);
    binary_counter c(i_temp,notclk,~(select_unload),4'd9);
    register_customised r(i,i_temp,clk,clear);
    mux_2X1 mux1(data_out[3:0],res[i][3:0],4'd0,unload_res);
    mux_2X1 mux2(data_out[7:4],res[i][7:4],4'd0,unload_res);
    mux_2X1 mux3(data_out[9:8],res[i][9:8],4'd0,unload_res);    
    
    
endmodule
