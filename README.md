# DSP-in-FPGA
Signal processing algorithm like FFT can be easily implemented in FPGA as I did in Xilinx 14.7 ISE. The main advantage of FPGA lies in its flexibility but its cost is its main disadvantage which is recently coming down. In future we can expect FPGA will have major role not only in academia and industry as well as in all parts of life.
## Introduction
A classical von-Neumann architecture enables a low pin-count and less no. of registers for the processor chip, however, with the disadvantage caused by a single common data and instruction bus to the main memory. On the other hand, RISC processors are simple and challenging at the same time. They are simple due to their considerably fewer instruction sets and variants as is indicated by their abbreviated nomenclature RISC (Reduced Instruction Set Computer) than that of Complex Instruction Set Computer (CISC). On the contrary, their design is a bit challenging due to higher degree of parallelism in their implementations and therefore, they become superior just in connection with well tuned compilers. Henceforth, In this article we will focus on design & implementation of DSP Processor based on RISC architecture using FPGA There are lots of platform on which DSP algorithms i.e. FFT, FIR and IIR filters can be implemented. Specifically, it can be implemented in DSP processor, a microprocessor specially designed to execute DSP algorithms & its applications within an ASIC (Application specific integrated circuit) or in a FPGA. Among all these ASIC is the fastest followed by FPGA which is further followed by DSP processor. Since both ASIC and FPGA are hardware based therefore they are faster than DSP processor which executes the instruction sets sequentially i.e software based. Comparatively ASIC is much faster than FPGA as it doesn’t comprehend switching blocks & it consists of less hardware for reconfigurationDigital signal processing has a long range of application like image processing, communication etc. A typical DSP processor consists of several noteworthy features like MAC unit (Multiply and accumulate unit), circular addressing scheme, zero overhead looping and pipelining. These features are most
important for implementation of DSP algorithm along   with which there can be other features like barrel shifter.  

## Pipelining
Pipelining is a process in which hardware element of the CPU is arranged such that overall performance is increased. Suppose there is an 8 point FFT having 3 stages. Let us suppose each butterfly takes T unit of execution time. For each stage the butterfly (2 point FFT) can be executed parallely so that each stage takes T unit of execution time. The first instruction will take 3T units of execution time while the rest of the instructions will have single cycle execution for pipelined FFT. Suppose if a bucket has to be filled by carrying water from well with the help of mug then it will take large time whereas if we have a pipe and motor that fetches water then it will yield very less time. Similar concept is applied in pipelined processor. Modern memory components often have a fast burst mode increasing the average data transfer rate which requires an efficient memory interface. Thus, it enables the loading of two instructions per cycle, which then should be executed in parallel by duplicate pipeline stages e.g. parallel ALUs (superscalar system). The only disadvantage in this system is the necessity for a more complex & new compiler and a more complex hardware control. 

## MAC UNIT (Multiply and accumulate)
This unit is used in most of the DSP processor. The basic MAC operation is R=R+(x×y), where R is an accumulator register, and x and y are the source operands from A and B registers respectively. It can also be implemented using Verilog HDL. Thus MAC which is an important instructional unit of any DSP processor can be easily implemented in FPGA.

## Zero Overhead Looping
Zero overhead looping is a feature in which hardware can repeat the loops i.e using register rather than software instruction being executed sequentially and increasing computational time

## Circular addressing
Circular addressing is used to create circular buffer such that it consists of pointer to point data without creating overhead due to post shift updated time.

## Barrel shifter 
It provides the capability to scale the data during an operand read or write. No overhead is required to implement the shift needed for the scaling operations. Let’s observe an example how DSP algorithm is implemented in FPGA.

## RTL Schematic of 4 point FFT
![image](![image](https://user-images.githubusercontent.com/99953169/225341005-9b8b09ec-21b5-473b-af3d-320c7a84f9c2.png)

## Simulation Result of 4 point FFT
![image](![image](![image](https://user-images.githubusercontent.com/99953169/225342374-6d32f3f6-441b-4a9d-8099-78d0091b43ac.png)
FFT[4] can be easily implemented in FPGA as I did in Xilinx 14.7 ISE. We got the correct output for a given input X0=1, X1=2, X2=3j, X3=4. Hence 4 point FFT algorithm is implemented on Xilinx 14.7 ise.

## CONCLUSIONS
Therefore,  a dedicated processor for DSP can be designed on FPGA which has static & dynamic data path to implement signal processing application.




