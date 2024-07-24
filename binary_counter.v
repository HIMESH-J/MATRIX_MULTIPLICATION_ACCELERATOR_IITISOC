module binary_counter(output [3:0] count,input clk,input clr,input[3:0] limit);
    wire q0,q1,q2,q3;
    
    wire j,k;
    
    assign j=(count<limit)?1'b1:1'b0;
    assign k=(count<limit)?1'b1:1'b0;
    jk_ff f0(q0,j,k,clk,clr);
    jk_ff f1(q1,j,k,q0,clr);
    jk_ff f2(q2,j,k,q1,clr);
    jk_ff f3(q3,j,k,q2,clr);

    
    assign count={q3,q2,q1,q0};
endmodule

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
