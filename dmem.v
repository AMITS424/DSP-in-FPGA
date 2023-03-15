`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:01:29 03/11/2022 
// Design Name: 
// Module Name:    dmem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dmem(Address, WriteData, Clk, WRMEM, RDMEM, ReadData); 

    input [23:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input WRMEM; 		// Control signal for memory write 
    input RDMEM; 			// Control signal for memory read 

    output reg[31:0] ReadData; // Contents of memory location at Address

    reg 	[31:0] 	Memory[0:1024];	// stack pointer initialization depends on this
      
   		always 	@(posedge Clk)		   //Memory write
   		begin
   		
			if (WRMEM==1) 
			     begin
				
					
						Memory[Address] = WriteData;
					end
				
   		end
   		
   		always @(Address or RDMEM)
   		begin	
   			if	(RDMEM == 1) 
				        begin
				
									ReadData <= Memory[Address];
							end
							
   		end 
   		
			
			initial $readmemh("test_data.txt",Memory);
			
endmodule

module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);

	input [4:0] ReadRegister1,ReadRegister2,WriteRegister;
	input [31:0] WriteData;
	input RegWrite,Clk;
	
	output reg [31:0] ReadData1,ReadData2;
	
	
	//reg [31:0] Registers = new reg[32];
	reg [31:0] Registers [0:31];
	
	initial begin
		Registers[0] <= 32'h00000000;
		Registers[8] <= 32'h00000000;
		Registers[9] <= 32'h00000000;
		Registers[10] <= 32'h00000000;
		Registers[11] <= 32'h00000000;
		Registers[12] <= 32'h00000000;
		Registers[13] <= 32'h00000000;
		Registers[14] <= 32'h00000000;
		Registers[15] <= 32'h00000000;
		Registers[16] <= 32'h00000000;
		Registers[17] <= 32'h00000000;
		Registers[18] <= 32'h00000000;
		Registers[19] <= 32'h00000000;
		Registers[20] <= 32'h00000000;
		Registers[21] <= 32'h00000000;
		Registers[22] <= 32'h00000000;
		Registers[23] <= 32'h00000000;
		Registers[24] <= 32'h00000000;
		Registers[25] <= 32'h00000000;
		Registers[29] <= 32'd252; // this value should point to the top of data memory, dont forget byte addressing
		Registers[31] <= 32'b0;
	end
	
	
	always @(posedge Clk)
	begin
		
		if (RegWrite == 1) 
		begin
			Registers[WriteRegister] <= WriteData;
		end
	end
	
	always @(negedge Clk)
	begin
		ReadData1 <= Registers[ReadRegister1];
		ReadData2 <= Registers[ReadRegister2];
	end
	
	

endmodule

		