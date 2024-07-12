`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 11:52:32
// Design Name: 
// Module Name: mux_mac
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_mac(output[9:0] out,input[9:0] y,input[7:0] x,input clear,ld );
    //assign out=clear?10'd0:ld?ynew:y;
    wire[9:0] ynew;
    adder_10bit add(ynew,y,{2'b00,x});
    
    wire cleardash;
    wire [9:0] out_temp1,out_temp2;
    wire lddash;
    not(cleardash,clear);
    not(lddash,ld);    
    
    and(out_temp1[0],cleardash,ld,ynew[0]);
    and(out_temp2[0],cleardash,lddash,y[0]);
    
    and(out_temp1[1],cleardash,ld,ynew[1]);
    and(out_temp2[1],cleardash,lddash,y[1]);
    
    and(out_temp1[2],cleardash,ld,ynew[2]);
    and(out_temp2[2],cleardash,lddash,y[2]);
    
    and(out_temp1[3],cleardash,ld,ynew[3]);
    and(out_temp2[3],cleardash,lddash,y[3]);
    
    
    and(out_temp1[4],cleardash,ld,ynew[4]);
    and(out_temp2[4],cleardash,lddash,y[4]);
    
    and(out_temp1[5],cleardash,ld,ynew[5]);
    and(out_temp2[5],cleardash,lddash,y[5]);
    
    and(out_temp1[6],cleardash,ld,ynew[6]);
    and(out_temp2[6],cleardash,lddash,y[6]);
    
    and(out_temp1[7],cleardash,ld,ynew[7]);
    and(out_temp2[7],cleardash,lddash,y[7]);
    
    and(out_temp1[8],cleardash,ld,ynew[8]);
    and(out_temp2[8],cleardash,lddash,y[8]);
    
    and(out_temp1[9],cleardash,ld,ynew[9]);
    and(out_temp2[9],cleardash,lddash,y[9]);
    
    or(out[0],out_temp1[0],out_temp2[0]);
    or(out[1],out_temp1[1],out_temp2[1]);
    or(out[2],out_temp1[2],out_temp2[2]);
    or(out[3],out_temp1[3],out_temp2[3]);
    or(out[4],out_temp1[4],out_temp2[4]);
    or(out[5],out_temp1[5],out_temp2[5]);
    or(out[6],out_temp1[6],out_temp2[6]);
    or(out[7],out_temp1[7],out_temp2[7]);
    or(out[8],out_temp1[8],out_temp2[8]);
    or(out[9],out_temp1[9],out_temp2[9]);
    
    
endmodule
