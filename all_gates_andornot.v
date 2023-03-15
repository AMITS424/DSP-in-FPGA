`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:18 04/25/2021 
// Design Name: 
// Module Name:    all_gates_andornot 
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
module all_gates_andornot(
    input a,
    input b,
	 input [2:0] select,
    output z
    );
	 parameter OR=3'b000, 
             AND=3'b001,
            NAND=3'b010,
             NOR=3'b011,
             XOR=3'b100,
            XNOR=3'b101,
			    NOT=3'b110;
				 
	reg out;
   reg  K,J,V,L;
	
	always@(a,b)
   case(select)
  OR :   out =a|b;
 AND :  out =a&b;
 NAND :  begin 
               K=a&b;
               out =~K;        
			end
 NOR :  begin 
        K=a|b;
        out =~K;
       end					
 XOR :  begin 
         K= a&V;
         V=~b;
         J=L&b;
          L=~a;
         out =K+J;
		 end
 XNOR  : begin 
         K= a&b;
          V=~b;
          L=~a;
			 J=V&L;
          out =K+J;
		 end 
 NOT :  out= ~(a);
 

endcase
         assign z=out;


endmodule



