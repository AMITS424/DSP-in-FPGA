`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:26 07/08/2021 
// Design Name: 
// Module Name:    MAC 
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
module MAC(
cp,
c,
Acc,
M0,
M1,
M2,
M3
    );
input cp;
output reg[7:0]c;
output reg[7:0] Acc;
reg[3:0] A[3:0], B[3:0];
output [7:0] M0,M1,M2,M3;
reg[3:0]counter;
initial counter=4'b0001;
initial Acc=8'b00000000;

assign M0=A[0] [3:0]*B[0] [3:0];
assign M1=A[1] [3:0]*B[1] [3:0];
assign M2=A[2] [3:0]*B[2] [3:0];
assign M3=A[3] [3:0]*B[3] [3:0];

reg[7:0] ac1,ac2,ac3,ac4;
initial ac1=8'b00000000;
initial ac2=8'b00000000;
initial ac3=8'b00000000;
initial ac4=8'b00000000;

always @(posedge cp)
begin
  counter=counter*2;
  if(counter<4'b0001)
  counter=4'b0001;
end
always @(posedge counter[1])
begin
  ac1=M0;
end
always @(posedge counter[2])
begin
  ac2=ac1+M1;
end
always @(posedge counter[3])
begin
  ac3=ac2+M2;
end
always @(posedge counter[0])
begin
  Acc=ac3+M3;
end

initial begin
$readmemb("A.txt",A);
$readmemb("B.txt",B);
end
endmodule

