`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 19:02:44
// Design Name: 
// Module Name: Mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Mux #(parameter WIDTH = 32)
(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input              Sel,
    output [WIDTH-1:0] Y
);

assign Y = Sel ? B : A;

endmodule
