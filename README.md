## Design Overview

The proposed design is rooted in the systolic array architecture, capable of multiplying compatible matrices up to a size of 3x3. Verilog code for all the modules have been written in gate level description.

##### Design:


![Systolic_Array_Design_Image](https://github.com/HIMESH-J/MATRIX_MULTIPLICATION_ACCELERATOR_IITISOC/blob/main/Design_Diagrams/Systolic_Array.jpg)
##### Block Diagram:

![Final_Design_Block_Diagram](https://github.com/HIMESH-J/MATRIX_MULTIPLICATION_ACCELERATOR_IITISOC/blob/main/Design_Diagrams/FINAL_DESIGN.png)
The design can be better understood via the following animation:
[design animation](https://github.com/HIMESH-J/MATRIX_MULTIPLICATION_ACCELERATOR_IITISOC/tree/main/Design_Diagrams)

This gate-level Verilog HDL implementation comprises the following core modules:

### Core Modules

* **Memory Bank:** Sequentially stores input matrix values row-wise and subsequently transfers them to the matrix multiplier. Detailed operations are elaborated in the accompanying code.
* **Matrix Multiplier:** Houses a systolic array of Multiply-Accumulate (MAC) units. Upon load signal activation, it processes data from the memory bank to perform matrix multiplication, outputting results row-wise per clock cycle.
* **MAC Unit:** The fundamental building block executing multiplication and accumulation operations synchronously with the clock's positive edge. Internally composed of a 4-bit multiplier and an accumulator.
* **Datapath:** Facilitates interconnections between the memory bank and matrix multiplier.
* **Multiplexers:** Encapsulates the gate-level implementation of multiplexers used for replacing if-else constructs.
* **Comparator:** Contains the gate-level realization of comparators and equality checkers utilized in other modules.
* **Multiplier:** Houses a 4-bit multiplier and a 2-bit multiplier, respectively employed in the MAC unit and for determining input matrix element count.
* **Adders:** Comprises gate-level descriptions of half-adder, full-adder, 4-bit adder, and 10-bit adder components used throughout the design.
* **Register:** Implements 4-bit and 10-bit registers to be used in design using jk flip flops designed  using just logic gates.The flip flop is triggered at every negative edge of                   clock.In order to clock pulse from clock signal just using logic gates we have used below circuit.
  ![clk_pulse_generator](https://github.com/user-attachments/assets/21da3fec-2ad6-477f-9ffa-e0fa6c36376b)
* **Binary_Counter:** This module implements a binary counter using jk flip flops which are used for generating address.
* **Testbench:** Comprises of verilog testbench code in order to verify the design by simulation. 

### Further Exploration

For a comprehensive understanding of the design's functionality, please refer to the Verilog code for each module. 
