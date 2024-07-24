module mem_bank(data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3,ld_mac,clear_mac,unload_res,
                data_in,clear_mem,row_w,row_x,col_w,col_x,
                clk);
  output [3:0] data_outw1,data_outw2,data_outw3,data_outx1,data_outx2,data_outx3;              //six output datalines,3 for each input matrix
  output[8:0]  ld_mac;                                                                         // output signal to start loading mac,8 signals for 8 macs
  output[8:0] clear_mac;                                                                       // output signal to clear macs,8 signals for 8 macs 
  output unload_res;                                                                           // output signal signifying that matrix multiplication is completed and results can be unloaded
  input[3:0] data_in;                                                                          // input  for input matrix elements to be stored
  input clear_mem;                                                                             // input signal to clear memory banks for input matrices
  input [1:0] row_w,row_x,col_w,col_x;                                                         // input  for no. of rows and columns of input matrices
  input clk;                                                                                   // input signal for clock
    
  wire[3:0] count_x,count_w;                                                                    // wires to store no.of elements in input matrices i.e no.of rows X no. of cols
    
  multiplier_2bit mulx(count_x,row_x,col_x);                                                    //instantiating 2-bit multiplier modules to calculate no. of elements
  multiplier_2bit mulw(count_w,row_w,col_w);
    
  wire[3:0] w_mem[8:0];                                                                          // memory for first matrix
  wire[3:0] x_mem[8:0];                                                                          // memory for second matrix
    
       
  reg[3:0] x;                                                                               // data loading address for x-matrix
  reg[3:0] w;
  wire[3:0] x_temp;
  wire[3:0] w_temp;                                                                               // dataloading  address for w-matrix
  wire[3:0] w_unload_temp,x_unload_temp;
  wire select_ldw,select_ldx,select_ldx_temp,select_ldwdash,select_ldxdash;                                      // select lines which will we be used to select whether to load w-matrix or x-matrix
    
  comparator_greater_than comp1(select_ldw,count_w,w);                                           //loading w if data load address for w is less than no. of elements in w 
  comparator_greater_than comp2(select_ldx_temp,count_x,x);                                        
  not(select_ldwdash,select_ldw);
  not(select_ldxdash,select_ldx);  
  and(select_ldx,select_ldx_temp,select_ldwdash);                                                // loading x if we are loading w and data load address for x is less than no. of elements in x
  wire clear_x_counter,clear_w_counter;
  wire notclk;
 
  or(clear_x_counter,clear_mem,select_ldw);
  not(notclk,clk);      
  binary_counter c1(w_temp,notclk,clear_mem,count_w);
  binary_counter c2(x_temp,notclk,clear_x_counter,count_x);
  always@(x_temp,w_temp)begin
    x=x_temp;
    w=w_temp;
  end
   
  wire load_w0;                                                                                  // control signal specifying whether we are loading address 0 or not
  equality_checker w0(load_w0,w,4'd0);                                                           // we are loading zero iff w==0
  mux_4X1 memw0(w_mem[0],data_in,w_mem[0],clear_mem,load_w0);                                    // mux with select lines load and clear, if clear is high then it assigns 0 if load is high then it assigns data_in otherwise it assigns itself to itself
    
  wire load_w1;                                                                                   // same logic followed for all the elements
  equality_checker w1(load_w1,w,4'd1);   
  mux_4X1 memw1(w_mem[1],data_in,w_mem[1],clear_mem,load_w1);
    
  wire load_w2;
  equality_checker w2(load_w2,w,4'd2);
  mux_4X1 memw2(w_mem[2],data_in,w_mem[2],clear_mem,load_w2);
    
  wire load_w3;
  equality_checker w3(load_w3,w,4'd3);
  mux_4X1 memw3(w_mem[3],data_in,w_mem[3],clear_mem,load_w3);
    
  wire load_w4;
  equality_checker w4(load_w4,w,4'd4);
  mux_4X1 memw4(w_mem[4],data_in,w_mem[4],clear_mem,load_w4);
    
  wire load_w5;
  equality_checker w5(load_w5,w,4'd5);
  mux_4X1 memw5(w_mem[5],data_in,w_mem[5],clear_mem,load_w5);
    
  wire load_w6;
  equality_checker w6(load_w6,w,4'd6);
  mux_4X1 memw6(w_mem[6],data_in,w_mem[6],clear_mem,load_w6);
    
  wire load_w7;
  equality_checker w7(load_w7,w,4'd7);
  mux_4X1 memw7(w_mem[7],data_in,w_mem[7],clear_mem,load_w7);
    
  wire load_w8;
  equality_checker w8(load_w8,w,4'd8);
  mux_4X1 memw8(w_mem[8],data_in,w_mem[8],clear_mem,load_w8);
            
  wire load_x0;                                                                                      // for loading x matrix
  equality_checker x0(load_x0,x,4'd0);    
  mux_4X1 memx0(x_mem[0],data_in,x_mem[0],clear_mem,load_x0);
    
  wire load_x1;
  equality_checker x1(load_x1,x,4'd1);    
  mux_4X1 memx1(x_mem[1],data_in,x_mem[1],clear_mem,load_x1);
    
  wire load_x2;
  equality_checker x2(load_x2,x,4'd2);    
  mux_4X1 memx2(x_mem[2],data_in,x_mem[2],clear_mem,load_x2);
    
  wire load_x3;
  equality_checker x3(load_x3,x,4'd3);    
  mux_4X1 memx3(x_mem[3],data_in,x_mem[3],clear_mem,load_x3);
    
  wire load_x4;
  equality_checker x4(load_x4,x,4'd4);    
  mux_4X1 memx4(x_mem[4],data_in,x_mem[4],clear_mem,load_x4);
    
  wire load_x5;
  equality_checker x5(load_x5,x,4'd5);    
  mux_4X1 memx5(x_mem[5],data_in,x_mem[5],clear_mem,load_x5);
    
  wire load_x6;
  equality_checker x6(load_x6,x,4'd6);    
  mux_4X1 memx6(x_mem[6],data_in,x_mem[6],clear_mem,load_x6);
    
  wire load_x7;
  equality_checker x7(load_x7,x,4'd7);    
  mux_4X1 memx7(x_mem[7],data_in,x_mem[7],clear_mem,load_x7);
    
  wire load_x8;
  equality_checker x8(load_x8,x,4'd8);    
  mux_4X1 memx8(x_mem[8],data_in,x_mem[8],clear_mem,load_x8);
  
  wire ld_mac_condition1;
  wire[8:0] ld_mac_condition2;    
  equality_checker check(ld_mac_condition1,x,count_x);                                                    // first condition to start multiplication i.e loading mac is that address of x is equal to no. of elements of x 
  
  comparator_greater_than m11(ld_mac_condition2[0],{2'd0,row_w},4'd0);                                    // second condition for each mac 
  and(ld_mac[0],ld_mac_condition2[0],ld_mac_condition1);                                                  // activating or loading iff both conditions are satisfied
    
  comparator_greater_than m12(ld_mac_condition2[1],{2'd0,col_x},4'd1);
  and(ld_mac[1],ld_mac_condition2[1],ld_mac_condition1);
    
  comparator_greater_than m13(ld_mac_condition2[2],{2'd0,col_x},4'd2);
  and(ld_mac[2],ld_mac_condition2[2],ld_mac_condition1);
    
  comparator_greater_than m21(ld_mac_condition2[3],{2'd0,row_w},4'd1);
  and(ld_mac[3],ld_mac_condition2[3],ld_mac_condition1);
    
  comparator_greater_than m22(ld_mac_condition2[4],{2'd0,col_x},4'd1);
  and(ld_mac[4],ld_mac_condition2[4],ld_mac_condition2[3],ld_mac_condition1);
    
  comparator_greater_than m23(ld_mac_condition2[5],{2'd0,col_x},4'd2);
  and(ld_mac[5],ld_mac_condition2[5],ld_mac_condition2[3],ld_mac_condition1);
    
  comparator_greater_than m31(ld_mac_condition2[6],{2'd0,row_w},4'd2);
  and(ld_mac[6],ld_mac_condition2[6],ld_mac_condition1);
    
  comparator_greater_than m32(ld_mac_condition2[7],{2'd0,col_x},4'd1);
  and(ld_mac[7],ld_mac_condition2[7],ld_mac_condition2[6],ld_mac_condition1);
    
  comparator_greater_than m33(ld_mac_condition2[8],{2'd0,col_x},4'd2);
  and(ld_mac[8],ld_mac_condition2[8],ld_mac_condition2[6],ld_mac_condition1);   
        
  not(clear_mac[0],ld_mac[0]);                                  // setting clear signals for mac to be opposite of load signals 
  not(clear_mac[1],ld_mac[1]);
  not(clear_mac[2],ld_mac[2]);
  not(clear_mac[3],ld_mac[3]);
  not(clear_mac[4],ld_mac[4]);
  not(clear_mac[5],ld_mac[5]);
  not(clear_mac[6],ld_mac[6]);
  not(clear_mac[7],ld_mac[7]);
  not(clear_mac[8],ld_mac[8]); 

    
  reg[3:0] w_unload=0;                                                                      // to store unload addresses
  reg[3:0] x_unload=0;
  
  wire select_unload_temp,select_unload;                                                   // select signals for data unloading to matrix multiplier module
  comparator_greater_than g(select_unload_temp,{2'd0,col_w},w_unload);                     // unloading data till unload address is less than no. of columns of w
  and(select_unload,ld_mac_condition1,select_unload_temp);                                 // also unloading data only when all the data elements of input matrices are stored that ld_mac_condition1 is high
    
  wire[3:0] w_unload_plus_1,w_unload_plus_col_w,w_unload_plus_2col_w;                      // according to our design(refer to systolic array image) we need data_outw1 to be w0 then w1 then w2,dataout w1 to be w3,w4 and the w5 and similarly for dataout w3
  wire[3:0] x_unload_plus_col_x;                                                           // for that we need to calculate w_unload+ col_w and w_unload + 2*col_w and also we need to increment w_unload every clock cycle
                                                                                           // for dataout_x1 we need x0,x3 and then x6 , for dataout_x2 we need x1,x4,and then x7 and for dataout x3 we need x2,x5,and then x8   
  adder_4bit add1(w_unload_plus_1,w_unload,4'd1);                                          // using 4bit adders to perform the required additions
  adder_4bit add2(x_unload_plus_col_x,x_unload,{2'd0,col_x});
  adder_4bit add3(w_unload_plus_col_w,w_unload,{2'd0,col_w});    
  adder_4bit add4(w_unload_plus_2col_w,w_unload_plus_col_w,{2'd0,col_w});
  
  mux_2X1 m3(w_unload_temp,w_unload_plus_1,w_unload,select_unload);                        // using mux to increment w_unload and x_unload only if we are unloading i.e select_unload is high
  mux_2X1 m4(x_unload_temp,x_unload_plus_col_x,x_unload,select_unload); 

  always@(posedge clk)
        w_unload=w_unload_temp;                                                            // updating w_unload at every positive edge pf clock after incrementing
  always@(posedge clk)
        x_unload=x_unload_temp;                                                            //updating x_unload at every positive edge pf clock after incrementing
  
  
  mux_2X1  mux_dataoutw1(data_outw1,w_mem[w_unload],4'd0,select_unload);                    // assigning values to dataout signals as described above using muxes
  mux_2X1  mux_dataoutw2(data_outw2,w_mem[w_unload_plus_col_w],4'd0,select_unload);
  mux_2X1  mux_dataoutw3(data_outw3,w_mem[w_unload_plus_2col_w],4'd0,select_unload);
  mux_2X1  mux_dataoutx1(data_outx1,x_mem[x_unload],4'd0,select_unload);
  mux_2X1  mux_dataoutx2(data_outx2,x_mem[x_unload+1],4'd0,select_unload);
  mux_2X1  mux_dataoutx3(data_outx3,x_mem[x_unload+2],4'd0,select_unload);
    
    
  equality_checker done_check(unload_res,w_unload,{2'd0,col_w});                            //if complete data unloading is done then w_unload will be equal to col_w, and hence multiplication will be finished, that implies we can start unloading the results computed
          
endmodule
