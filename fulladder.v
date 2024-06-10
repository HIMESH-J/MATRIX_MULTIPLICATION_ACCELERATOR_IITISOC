`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2024 11:27:27
// Design Name: 
// Module Name: fulladder
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


module fulladder(
input a,b,cin,
output sum,cout
    );
    wire hsum,hc1,hc2;
    adder p1(a,b,hsum,hc1);
    adder q1(hsum,cin,sum,hc2);
    or o(cout,hc1,hc2);
endmodule
