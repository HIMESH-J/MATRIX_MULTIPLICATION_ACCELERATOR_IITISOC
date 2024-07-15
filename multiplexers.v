module mux_4X1(output[3:0] out,input[3:0] y,input[3:0] x,input clear,ld );
    wire cleardash;
    wire [3:0] out_temp1,out_temp2;
    wire lddash;
    not(cleardash,clear);
    not(lddash,ld);    
    
    and(out_temp1[3],y[3],cleardash,ld);
    and(out_temp1[2],y[2],cleardash,ld);
    and(out_temp1[1],y[1],cleardash,ld);
    and(out_temp1[0],y[0],cleardash,ld);
    
    and(out_temp2[3],x[3],cleardash,lddash);
    and(out_temp2[2],x[2],cleardash,lddash);
    and(out_temp2[1],x[1],cleardash,lddash);
    and(out_temp2[0],x[0],cleardash,lddash);
    
    or(out[3],out_temp2[3],out_temp1[3]);
    or(out[2],out_temp2[2],out_temp1[2]);
    or(out[1],out_temp2[1],out_temp1[1]);
    or(out[0],out_temp2[0],out_temp1[0]);
    
endmodule
