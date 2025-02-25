module binary_counter(output [3:0] count,input clk,input clr,input[3:0] limit);
    wire q0,q1,q2,q3;
    
    wire j,k;
    wire select_count;
    comparator_greater_than count_limit(select_count,limit,count);
    
    mux_2X1_1bit set_j(j,1'b1,1'b0,select_count);
    mux_2X1_1bit set_l(k,1'b1,1'b0,select_count);
    jk_ff f0(q0,j,k,clk,clr);
    jk_ff f1(q1,j,k,q0,clr);
    jk_ff f2(q2,j,k,q1,clr);
    jk_ff f3(q3,j,k,q2,clr);

    
    assign count={q3,q2,q1,q0};
endmodule
