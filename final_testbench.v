`include "controller.v"
`include "datapath.v"

module testbench();
    reg[3:0] data_in;
    wire done;
    reg clk;
    reg ldw,ldx,ld;
    reg clear_mac,clear_mem;

    initial
        clk=1'b0;
    always #5 clk=~clk;

    controller c(start,clk,done,unload1,unload2,unload3);
    datapath d(data_in,ldw,ldx,ld,clear_mem,clear_mac,clk,unload1,unload2,unload3,start);

    initial
        begin clear_mem<=1'b1;clear_mac<=1'b1;ldw<=1'b0;ldx<=1'b0;ld<=1'b0;end
    initial
        begin
            // test-set 1
          /*#1  data_in=4'b0001;clear_mem=0;ldw=1;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;ldw=0;ldx=1;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #6 ldx<=1'b0;// data uploading completed
          // matrix multiplication starts*/
          // test-set 2
          /*#1  data_in=4'b0010;clear_mem=0;ldw=1;
          #10 data_in=4'b0000;
          #10 data_in=4'b0011;
          #10 data_in=4'b0101;
          #10 data_in=4'b0011;
          #10 data_in=4'b0001;
          #10 data_in=4'b0001;
          #10 data_in=4'b1000;
          #10 data_in=4'b0001;
          #10 data_in=4'b1001;ldw=0;ldx=1;
          #10 data_in=4'b0001;
          #10 data_in=4'b0101;
          #10 data_in=4'b1000;
          #10 data_in=4'b0011;
          #10 data_in=4'b0101;
          #10 data_in=4'b0001;
          #10 data_in=4'b0100;
          #10 data_in=4'b1000;
          #6 ldx<=1'b0;// data uploading completed*/
          //test-set3
          #1  data_in=2;clear_mem=0;ldw=1;
          #10 data_in=3;
          #10 data_in=4;
          #10 data_in=5;
          #10 data_in=6;
          #10 data_in=8;
          #10 data_in=7;
          #10 data_in=4;
          #10 data_in=2;
          #10 data_in=9;ldw=0;ldx=1;
          #10 data_in=3;
          #10 data_in=0;
          #10 data_in=8;
          #10 data_in=5;
          #10 data_in=3;
          #10 data_in=6;
          #10 data_in=9;
          #10 data_in=7;
          #6 ldx<=1'b0;// data uploading completed*/
          
          // matrix multiplication starts
          clear_mac=1'b0;ld=1'b1;
        end 
        always@(*)
            if(done)#6 ld=1'b0;
        /*initial
            $monitor($time," %b",done);*/
        initial
            $monitor($time," \n    %d %d %d",d.m.o11,d.m.o12,d.m.o13,
                   "\n    %d %d %d",d.m.o21,d.m.o22,d.m.o23,
                   "\n    %d %d %d ",d.m.o31,d.m.o32,d.m.o33);
                     
          /* initial
                $monitor($time," %d ",d.b.x_mem[5]);*/
        initial
            #500 $display(" \n    %d %d %d",d.b.w_mem[0],d.b.w_mem[1],d.b.w_mem[2],
                   "\n    %d %d %d",d.b.w_mem[3],d.b.w_mem[4],d.b.w_mem[5],
                   "\n    %d %d %d ",d.b.w_mem[6],d.b.w_mem[7],d.b.w_mem[8]);
        initial
            #500 $display(" \n    %d %d %d",d.b.x_mem[0],d.b.x_mem[1],d.b.x_mem[2],
                   "\n    %d %d %d",d.b.x_mem[3],d.b.x_mem[4],d.b.x_mem[5],
                   "\n    %d %d %d ",d.b.x_mem[6],d.b.x_mem[7],d.b.x_mem[8]);         

        initial #10000 $finish;


    endmodule