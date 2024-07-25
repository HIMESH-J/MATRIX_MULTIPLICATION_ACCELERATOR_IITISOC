## Design Overview

The proposed design is rooted in the systolic array architecture, capable of multiplying compatible matrices up to a size of 3x3. Verilog code for all the modules have been written in gate level description.

##### Systolic Array Design:


![Systolic_Array_Design_Image](https://github.com/HIMESH-J/MATRIX_MULTIPLICATION_ACCELERATOR_IITISOC/blob/main/Design_Diagrams/Systolic_Array.jpg)

##### Block Diagram:

![Final_Design_Block_Diagram](https://github.com/HIMESH-J/MATRIX_MULTIPLICATION_ACCELERATOR_IITISOC/blob/main/Design_Diagrams/FINAL_DESIGN.png)

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
* **Register:** Implemnts jk flip flops just using logic gates.The flip flop is triggered at every negative edge of clock.In order to clock pulse from clock signal just using logic gates we have used below circuit. ![edge triggering](https://github.com/HIMESH-/MATRIX_MULTIPLICATION_ACCELERATOR_IITISOC/blob/main/Design_Diagrams/clk_pulse_generator.png)

### Further Exploration

For a comprehensive understanding of the design's functionality, please refer to the Verilog code for each module. 
