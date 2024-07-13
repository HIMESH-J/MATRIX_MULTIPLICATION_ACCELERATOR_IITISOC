//This Verilog code defines a module matmul that performs matrix multiplication using instances of the MAC (Multiply-Accumulate) module. 


module matrix_multiplier( data_out,data_w1,data_w2,data_w3,data_x1,data_x2,data_x3,clk,load,clear,unload_res);
    
    output reg[9:0] data_out;
    input[3:0] data_w1,data_w2,data_w3,data_x1,data_x2,data_x3;
    input clk,load,clear;
    input unload_res;
    
    wire[9:0] res[8:0];
    reg[3:0] i=4'd0;
    
    MAC m11(data_w1,data_x1,res[0],clk,load,clear);
    MAC m12(data_w1,data_x2,res[1],clk,load,clear);
    MAC m13(data_w1,data_x3,res[2],clk,load,clear);
    
    MAC m21(data_w2,data_x1,res[3],clk,load,clear);
    MAC m22(data_w2,data_x2,res[4],clk,load,clear);
    MAC m23(data_w2,data_x3,res[5],clk,load,clear);
    
    MAC m31(data_w3,data_x1,res[6],clk,load,clear);   
    MAC m32(data_w3,data_x2,res[7],clk,load,clear);    
    MAC m33(data_w3,data_x3,res[8],clk,load,clear);
    
    
    always@(posedge clk)begin
        if(unload_res&&i<9) begin
            data_out=res[i];
            i=i+1;
        end
        //else data_out=10'd0;
    end
    
    
endmodule
