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

