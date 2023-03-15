`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:30 02/24/2021 
// Design Name: 
// Module Name:    all_module 
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
module allmodule(
    input a,
    input b,
    input [2:0] select,
    output  z
    );
				 
	reg out;
            reg  K,J,V,L;
	
always@(a,b)
   case(select)
3'b000:   out =a|b;
3'b001:  out =a&b;
3'b010 :  begin 
               K=a&b;
               out =~K;        
	end
3'b011:  begin 
        K=a|b;
        out=~K;
       end					
3'b100:  begin 
         K= a&V;
         V=~b;
         J=L&b;
          L=~a;
         out=K+J;
           end
3'b101  : begin 
         K= a&b;
          V=~b;
          L=~a;
          J=V&L;
          out=K+J;
	 end 
3'b110:  out=~(a);
 endcase
not(z,~out);

endmodule