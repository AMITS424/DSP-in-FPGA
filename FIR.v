`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:15 05/10/2021 
// Design Name: 
// Module Name:    FIR 
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
module FIR(
     input clk,
        input signed [7:0] Xn,
        output reg signed [15:0] Yn
		   
        );
     wire signed   [7:0] h0,h1,h2,h3;
 //impulse response
    assign h0 = 1;
    assign h1 = 2;
    assign h2 = 3;
    assign h3 = 4;


//multiplier
    wire signed   [15:0] M0,M1,M2,M3;
	 //adder
	 wire signed [15:0] adder1,adder2,adder3;
	 
    wire signed     [15:0] D1,D2,D3;
    



    assign M3 = h3*Xn;
    assign M2 = h2*Xn;
    assign M1 = h1*Xn;
    assign M0 = h0*Xn;

    assign adder1 = D1 + M2;
    assign adder2 = D2 + M1;
    assign adder3 = D3 + M0;    

//delay
   d_ff dff1 (.clk(clk),.reset(),.d(M3),.q(D1));
   d_ff dff2 (.clk(clk),.reset(),.d(adder1),.q(D2));
   d_ff dff3 (.clk(clk),.reset(),.d(adder2),.q(D3));

//output
    always@ (posedge clk)
        Yn <= adder3;

endmodule



module d_ff(
input reset,clk,
 input [15:0] d,
output [15:0] qb,
 output reg [15:0] q);
always@(posedge clk)
begin  
   if(reset)
       q=0;
    else
       q=d;
end
assign qb=~(q);

endmodule




