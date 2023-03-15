`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:08:55 05/14/2021 
// Design Name: 
// Module Name:    fft4p 
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
module fft4p(input [7:0] x0,
	 input[7:0]x0i,
	  input [7:0] x1,
	 input[7:0]x1i,
	 input [7:0] x2,
	 input[7:0]x2i,
	  input [7:0] x3,
	 input[7:0]x3i,
	 input clk,
    output [7:0] OP0,
    output [7:0] OP0i,
	  output [7:0] OP1,
    output [7:0] OP1i,
	  output [7:0] OP2,
    output [7:0] OP2i,
	 output [7:0] OP3,
    output [7:0] OP3i
    );
	
	wire [7:0] y0, y0i, y1, y1i,y2, y2i, y3, y3i;
	butterfly_2pointfft b1(.ar(x0),.ai(x0i),.br(x2),.bi(x2i),.y1r(y0),.y1i(y0i),.y2r(y1),.y2i(y1i));
	 butterfly_2pointfft b2(.ar(x1),.ai(x1i),.br(x3),.bi(x3i),.y1r(y2),.y1i(y2i),.y2r(y3),.y2i(y3i));
   reg [7:0] input_real0;
	reg [7:0] input_real1;
	reg [7:0] input_real2;
	reg [7:0] input_real3;
	
	reg [7:0] input_imag0;
	reg [7:0] input_imag1;
	reg [7:0] input_imag2;
	reg [7:0] input_imag3;
	
	always@(posedge clk)
	begin 
	 input_real0<= y0;
    input_real1<=y1;
    input_real2<=y2;
    input_real3<=y3;
    input_imag0<=y0i;
    input_imag1<=y1i;
    input_imag2<=y2i;
    input_imag3<=y3i;
   end
	
	reg[7:0] Mr,Mi;

	 always@(*)
	 begin
	  Mr <=input_imag3;
	  Mi <=(~(input_real3))+1;
	 end
   wire [7:0] output_real0;
	wire [7:0] output_real1;
	wire [7:0] output_real2;
	wire [15:0] output_real3;
	
	wire [7:0] output_imag0;
	wire [7:0] output_imag1;
	wire [7:0] output_imag2;
	wire [7:0] output_imag3;
	
	butterfly_2pointfft b3(.ar(input_real0),.ai(input_imag0),.br(input_real2),.bi(input_imag2),.y1r(output_real0),.y1i(output_imag0),.y2r(output_real2),.y2i(output_imag2));
	butterfly_2pointfft b4(.ar(input_real1),.ai( input_imag1),.br(Mr),.bi(Mi),.y1r(output_real1),.y1i(output_imag1),.y2r(output_real3),.y2i(output_imag3));
	
	assign OP0= output_real0;
	assign OP1=output_real1;
	assign OP2=output_real2;
	assign OP3=output_real3;
	assign OP0i= output_imag0;
	assign OP1i=output_imag1;
	assign OP2i=output_imag2;
	assign OP3i=output_imag3;
	
	
	endmodule


module butterfly_2pointfft(ar,ai,br,bi,y1r,y1i,y2r,y2i);
input [7:0]ar;
input [7:0]ai;
input [7:0]br;
input [7:0]bi;
output reg signed [7:0]y1r;
output reg signed [7:0]y2r;
output reg signed [7:0]y1i;
output reg signed [7:0]y2i;

always@(ar,ai,br,bi) 
begin

 y1r <= ar + br;			
 y1i <= ai + bi;		
 y2r <= ar - br;			
 y2i <= ai - bi;		
end

endmodule

