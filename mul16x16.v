`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:41:29 09/02/2021 
// Design Name: 
// Module Name:    mul16x16 
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
module mul16x16(a,b,out
    );
input [15:0] a,b;
output reg [31:0] out;
wire [15:0] pp0= a&{16{b[0]}}; //pp means partial product
wire [15:0] pp1= a&{16{b[1]}};
wire [15:0] pp2= a&{16{b[2]}};
wire [15:0] pp3= a&{16{b[3]}};
wire [15:0] pp4= a&{16{b[4]}};
wire [15:0] pp5= a&{16{b[5]}};
wire [15:0] pp6= a&{16{b[6]}};
wire [15:0] pp7= a&{16{b[7]}};
wire [15:0] pp5= a&{16{b[8]}};
wire [15:0] pp6= a&{16{b[9]}};
wire [15:0] pp7= a&{16{b[10]}};
wire [15:0] pp6= a&{16{b[11]}};
wire [15:0] pp7= a&{16{b[12]}};
wire [15:0] pp5= a&{16{b[13]}};
wire [15:0] pp6= a&{16{b[14]}};
wire [15:0] pp7= a&{16{b[15]}};
always @(*)
begin
out = (({16'b1,~pp0[15], pp0[14:0]} + {15'b0,~pp1[15], pp1[14:0],1'b0}) + 
({14'b0,~pp2[15], pp2[14:0],2'b0} + {5'b0,~pp3[7], pp3[6:0],3'b0})) 
+ (({4'b0,~pp4[7], pp4[6:0],4'b0} + {3'b0,~pp5[7], pp5[6:0],5'b0}) + 
({2'b0,~pp6[7], pp6[6:0],6'b0} + {1'b1, pp7[7],~pp7[6:0],7'b0})); 
end


endmodule



endmodule
