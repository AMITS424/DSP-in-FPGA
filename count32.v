`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:11 12/13/2021 
// Design Name: 
// Module Name:    count32 
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
module count32(
    input clk,
    input rst,
    output reg [31:0] count
    );
always @(posedge clk)
begin
  if (rst)
    count = 32'b0; 
  else
    count = count + 1;
end

endmodule
