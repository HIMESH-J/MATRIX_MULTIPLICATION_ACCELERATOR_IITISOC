module jk_ff(output q,input j,input k,input clk,input clear);
    wire temp1,temp2,qbar;
    wire temp3,temp4;
    wire temp5,temp6,temp7,temp8;
    wire clearbar;
    
    not(temp3,clk);
    not(temp4,temp3);
    not(temp5,temp4);
    not(temp6,temp5);
    not(temp7,temp6);
    nor(clk_pulse,clk,temp5);
    
    not(clearbar,clear);
    
    nand(temp1,j,qbar,clk_pulse);
    nand(temp2,k,q,clk_pulse);    
    nand(q,qbar,temp1);
    nand(qbar,q,temp2,clearbar);    
        
    
endmodule

module register_customised(output [3:0] out,input[3:0] in,input clk,input clr);
    wire q0,q1,q2,q3;
    wire[3:0] inbar;
    not(inbar[0],in[0]);
    not(inbar[1],in[1]);
    not(inbar[2],in[2]);
    not(inbar[3],in[3]);
    jk_ff f0(q0,in[0],inbar[0],clk,clr);
    jk_ff f1(q1,in[1],inbar[1],clk,clr);
    jk_ff f2(q2,in[2],inbar[2],clk,clr);
    jk_ff f3(q3,in[3],inbar[3],clk,clr);
    assign out={q3,q2,q1,q0};
    
endmodule

module register_customised_10bit(output [9:0] out,input [9:0] in,input clk,input clr);
    wire q0,q1,q2,q3,q4,q5,q6,q7,q8,q9;
    wire[9:0] inbar;
    not(inbar[0],in[0]);
    not(inbar[1],in[1]);
    not(inbar[2],in[2]);
    not(inbar[3],in[3]);
    not(inbar[4],in[4]);
    not(inbar[5],in[5]);
    not(inbar[6],in[6]);
    not(inbar[7],in[7]);
    not(inbar[8],in[8]);
    not(inbar[9],in[9]);
    
    jk_ff f0(q0,in[0],inbar[0],clk,clr);
    jk_ff f1(q1,in[1],inbar[1],clk,clr);
    jk_ff f2(q2,in[2],inbar[2],clk,clr);
    jk_ff f3(q3,in[3],inbar[3],clk,clr);
    jk_ff f4(q4,in[4],inbar[4],clk,clr);
    jk_ff f5(q5,in[5],inbar[5],clk,clr);
    jk_ff f6(q6,in[6],inbar[6],clk,clr);
    jk_ff f7(q7,in[7],inbar[7],clk,clr);
    jk_ff f8(q8,in[8],inbar[8],clk,clr);
    jk_ff f9(q9,in[9],inbar[9],clk,clr);
    
    assign out= {q9,q8,q7,q6,q5,q4,q3,q2,q1,q0};    
     
    
endmodule


