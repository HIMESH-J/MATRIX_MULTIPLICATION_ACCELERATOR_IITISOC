`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2024 12:02:02
// Design Name: 
// Module Name: stimuli
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


module stimuli(

    );
    reg [3:0] n1;
    reg [3:0] n2;
    wire [7:0] op;
    multiplier uut(n1,n2,op);
    initial
    begin
    n1=16'ha; n2=16'hf;
    #10 n1=16'h4; n2=16'h3;
    #10 $finish;
    end
endmodule
