`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:06:45 03/31/2021 
// Design Name: 
// Module Name:    FULLADDER 
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
module FULLADDER( a,
                  b,
                  c,
                  sum,
                  carry);

  // Step 1. Write down the directions for the ports	     
  input a,b,c;
  output sum, carry;

  // Step 2. Declare the internal wires    
  wire w1, w2, w3;

  // Step 3. Instantiate two Half-Adders
  half_adder HA1(.a(a), .b(b), .sum(w1), .carry(w2));
  half_adder HA2(.a(w1), .b(c), .sum(sum), .carry(w3));

  // Step 4. Instantiate the OR gate
  or or1(carry, w2, w3);

endmodule
module half_adder(a,
                  b,
                  sum,
                  carry);
  input  a,
         b;
  output sum,
         carry;

  xor(sum,a,b);
 and(carry,a,b);
endmodule




