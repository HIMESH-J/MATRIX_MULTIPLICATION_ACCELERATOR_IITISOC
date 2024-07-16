`timescale 1ns / 1ps

module adder(//half adder with sum(s) and carry(c)
    input a,
    input b,
    output s,
    output c
    );
    xor x1(s,a,b);
    and a1(c,a,b);
endmodule 

module fulladder(//full adder with carryin(cin), carryout(cout) and sum(s)
input a,b,cin,
output sum,cout
    );
    wire hsum,hc1,hc2;
    adder p1(a,b,hsum,hc1);
    adder q1(hsum,cin,sum,hc2);
    or o(cout,hc1,hc2);
endmodule

module adder_4bit(output[3:0] out,input[3:0] a,b);
    wire carries[2:0];
    fulladder f1(a[0],b[0],1'b0,out[0],carries[0]);
    fulladder f2(a[1],b[1],carries[0],out[1],carries[1]);
    fulladder f3(a[2],b[2],carries[1],out[2],carries[2]);
    fulladder f4(a[3],b[3],carries[2],out[3],out[4]);
    
endmodule

module adder_10bit(output[9:0] out,input[9:0]a,b);
    wire carries[9:0];
    fulladder f1(a[0],b[0],1'b0,out[0],carries[0]);
    fulladder f2(a[1],b[1],carries[0],out[1],carries[1]);
    fulladder f3(a[2],b[2],carries[1],out[2],carries[2]);
    fulladder f4(a[3],b[3],carries[2],out[3],carries[3]);
    fulladder f5(a[4],b[4],carries[3],out[4],carries[4]);
    fulladder f6(a[5],b[5],carries[4],out[5],carries[5]);
    fulladder f7(a[6],b[6],carries[5],out[6],carries[6]);
    fulladder f8(a[7],b[7],carries[6],out[7],carries[7]);
    fulladder f9(a[8],b[8],carries[7],out[8],carries[8]);
    fulladder f10(a[9],b[9],carries[8],out[9],carries[9]);
    
    

endmodule

