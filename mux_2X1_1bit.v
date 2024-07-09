`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2024 17:46:29
// Design Name: 
// Module Name: mux_2X1_1bit
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


module mux_2X1_1bit(output res,input a,input b,input select  );
wire temp1,temp2,selectdash;

and(temp1,select,a);
not(selectdash,select);
and(temp2,selectdash,b);
or(res,temp1,temp2);

endmodule
