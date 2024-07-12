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
