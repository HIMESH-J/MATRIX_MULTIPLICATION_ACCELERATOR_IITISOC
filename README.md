## Design Overview

The proposed design is rooted in the systolic array architecture, capable of multiplying compatible matrices up to a size of 3x3. Verilog code for all the modules have been written in gate level description.

#### Design:
![Systolic_array](https://github.com/user-attachments/assets/69fbeb5b-156f-4a47-a0a1-e2b71f0baac6)

Suppose we want to multiply two 3X3 matrices:
![matrix](https://github.com/user-attachments/assets/4402ae77-08b7-4d76-b551-9c684c8b98e4)
Then following steps will be followed:-
* **Step-0:**
  
  ![step-0](https://github.com/user-attachments/assets/522fb688-da7b-4c04-a2d4-b46c3bed6e20)
* **Step-1:**
  
  ![step-1](https://github.com/user-attachments/assets/ced60285-837b-489b-a030-94e810d37e75)
* **Step-2:**
  
  ![step-2](https://github.com/user-attachments/assets/2b16060a-dc6e-40a4-a4c9-5af25b480182)
* **Step-3:**
   
   ![step-3](https://github.com/user-attachments/assets/25cd1157-f22c-4dc8-b83c-afb882757558)


#### Block Diagram:

![Final_Design_Block_Diagram](https://github.com/HIMESH-J/MATRIX_MULTIPLICATION_ACCELERATOR_IITISOC/blob/main/Design_Diagrams/FINAL_DESIGN.png)
#### Making our Design capable to multiply any two compatible matrices:  

In Order to multiply matrices of sizes other than 3X3 we have controlled the data out values in each step such that we get correct results. For example lets take example of a 3X2 matrix. Data_out X1 in first cycle will be x1, in second cycle x3 , in third cycle will be x5.(notice that index in each cycle is increasing by number of rows of x matrix). Similar logic has been implemented for Data_out x2 and Data_out x3.

Now lets consider Data_out w1. In first cycle its value will be w1, in next cycle it will be w2,then w3 and so on. That means in every cycle the index increments by 1. Similar logic has been implemented for Data_out w2 and Data_out w3.

We go through as many cycles as there are number of rows in 2nd matrix ( which is equal to number of columns of first matrix if matrix multiplication is allowed).

### Core Modules
This gate-level Verilog HDL implementation comprises the following core modules:

* **Memory Bank:** Sequentially stores input matrix values row-wise and subsequently transfers them to the matrix multiplier. Detailed operations are elaborated in the accompanying code.
* **Matrix Multiplier:** Houses a systolic array of Multiply-Accumulate (MAC) units. Upon load signal activation, it processes data from the memory bank to perform matrix multiplication, outputting results row-wise per clock cycle.
* **MAC Unit:** The fundamental building block executing multiplication and accumulation operations synchronously with the clock's positive edge. Internally composed of a 4-bit multiplier and an accumulator.
* **Datapath:** Facilitates interconnections between the memory bank and matrix multiplier.
* **Multiplexers:** Encapsulates the gate-level implementation of multiplexers used for replacing if-else constructs.
* **Comparator:** Contains the gate-level realization of comparators and equality checkers utilized in other modules.
* **Multiplier:** Houses a 4-bit multiplier and a 2-bit multiplier, respectively employed in the MAC unit and for determining input matrix element count.
  
* **Adders:** Comprises gate-level descriptions of half-adder, full-adder, 4-bit adder, and 10-bit adder components used throughout the design.
* **Register:** Implements 4-bit and 10-bit registers to be used in design using jk flip flops designed  using just logic gates.The flip flop is triggered at every negative edge of                   clock.In order to clock pulse from clock signal just using logic gates we have used below circuit.
![pulse_gen](https://github.com/user-attachments/assets/e391e62b-9dfe-41fe-a536-9308a1abbc14) 
  
* **Binary_Counter:** This module implements a binary counter using jk flip flops which are used for generating address.
* **Testbench:** Comprises of verilog testbench code in order to verify the design by simulation.
### Verification and Simulation:-
The Design was verified using Vivado through various test cases. For Example one of the test cases is as follows:-
* **Expected-Result:**  
![test_case](https://github.com/user-attachments/assets/5219da3c-645c-431a-bd0e-089ef839b5a5)
* **Vivado simulation Results:**  
![Simulation Result](https://github.com/user-attachments/assets/99c270fe-728d-4156-b435-4cd4302279eb)
### Major Advantages of Our Design:-
* **Scalability:** Our design is highly scalable and can be easily scaled to multiply higher order matrices.
* **Data reusability:** We access each data value only once and perform all the necessary calculations required.
* **Parallelism:** We have a dedicated MAC for each of our output which helps in processing each of the data elements parallely. 

### Further Exploration

For a comprehensive understanding of the design's functionality, please refer to the Verilog code for each module. 
