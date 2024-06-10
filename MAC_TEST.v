`include "MAC.v"

module mac_test();
    reg[3:0] w,x;
    reg clk,load,clear;
    wire[7:0] o;
    initial
        clk=1'b0;
    always  
        #5 clk=~clk;  
    MAC m(w,x,o,clk,load,clear);
    initial
        clear=1;      
    initial
        begin
          #3 x<=4'b1111;w<=4'b1111;load<=1;clear<=0;
          #10 x<=4'b0010;w<=4'b0011;
          #10 x<=4'b0011;w<=4'b0101;
          #10 x<=4'b0001;w<=4'b1000;
          #10   load<=0;
        end
    
            
    initial
        $monitor($time," acc_value=%d",o);        
    initial
     #51 $finish;

endmodule