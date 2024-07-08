module mux_2X1(output reg[3:0] out,input[3:0] in1,in2,input select,clk);
    wire[3:0] temp;
    wire[3:0] temp1,temp2;
    wire selectdash;
    
    not(selectdash,select);
    
    and(temp1[0],select,in1[0]);
    and(temp2[0],selectdash,in2[0]);
    or(temp[0],temp1[0],temp2[0]);
    
    and(temp1[1],select,in1[1]);
    and(temp2[1],selectdash,in2[1]);
    or(temp[1],temp1[1],temp2[1]);
    
    and(temp1[2],select,in1[2]);
    and(temp2[2],selectdash,in2[2]);
    or(temp[2],temp1[2],temp2[2]);
    
    and(temp1[3],select,in1[3]);
    and(temp2[3],selectdash,in2[3]);
    or(temp[3],temp1[3],temp2[3]);
    
    always@(posedge clk)
        out=temp;

endmodule

