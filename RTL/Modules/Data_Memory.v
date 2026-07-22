`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 19:02:44
// Design Name: 
// Module Name: Data_memory
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

module Data_memory
(
    input              clk,
    input              WE,
    input      [31:0]  A,
    input      [31:0]  WD,
    output     [31:0]  RD
);

reg [31:0] Data_MEM [0:1023];

assign RD = (WE) ? 32'd0 : Data_MEM[A];

always @(posedge clk)
begin
    if(WE)
        Data_MEM[A] <= WD;
end

endmodule