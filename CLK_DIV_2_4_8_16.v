`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:27 06/13/2021 
// Design Name: 
// Module Name:    CLK_DIV_2_4_8_16 
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
module CLK_DIV_2_4_8_16(cp,
d,
t,
k,
p,
l
   );
input cp;
output reg d;

initial d=0;

output reg  t;
initial t=0;
output reg [1:0] k;
initial k=0;
output reg  p;
initial p=0;
output reg  l;
initial l=0;
always @(posedge cp)
begin
  t=t+1;
end
always @(posedge t)
begin  
   k=k+1;
end
always @(posedge k[1])
begin  
   p=p+1;
end
always @(posedge t)
begin  
   d=d+1;
end

always @(posedge d)
begin  
   l=l+1;
end
  

endmodule
