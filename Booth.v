`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:49:09 09/11/2021 
// Design Name: 
// Module Name:    Booth 
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
module Booth(Clk, Reset, A, B, C);
	input Clk, Reset;
	input[63:0] A, B;
	
	output[127:0] C;
	reg[127:0] C;
	
	reg [128:0] Product;
	integer i;
	reg[63:0] temp;
	
	always @(posedge Clk, negedge Reset)
	begin
		if(!Reset)
			C <= 0;
		else
			C <= Product[128:1];
	end


	always @(*)
	begin
		Product = {64'h0, B, 1'b0};
		
		for(i = 0; i < 64; i = i+1)
		begin
			if( Product[1:0] == 1 )
			begin
				temp = Product[128:65] + A;
				Product = { temp, Product[64:0] };
			end
			else if( Product[1:0] == 2 )
			begin
				temp = Product[128:65] - A;
				Product = { temp, Product[64:0] };
			end

			Product = {Product[128], Product[128:1]};
		end

	end

endmodule



