//`include "matrix_multiplier.v"
//`include "mem_bank.v"

module controller(start,clk,done,unload1,unload2,unload3);
    input start,clk;
    output reg done;
    reg[1:0] state;
    output reg unload1,unload2,unload3;
    initial
        done<=1'b0;
    parameter S0=2'b00, S1=2'b01,S2=2'b10,S3=2'b11;    
    always@(posedge clk)
        begin
          case(state)
          S0: if(start)state<=S1;
          S1: state<=S2;
          S2: state<=S3;
          S3: done=1'b1;
          default: state<=S0;
          endcase
        end
    always@(state)
        begin
            case(state)
                S0: begin unload1=1'b0;unload2=1'b0;unload3=1'b0;end
                S1: begin #1unload1=1'b1;unload2=1'b0;unload3=1'b0;end
                S2: begin #5unload1=1'b0;unload2=1'b1;unload3=1'b0;end
                S3: begin #5unload1=1'b0;unload2=1'b0;unload3=1'b1;#10 unload3=1'b0;end
                default: begin unload1=1'b0;unload2=1'b0;unload3=1'b0;end
            endcase  
        end  

endmodule