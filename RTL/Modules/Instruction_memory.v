`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 19:02:44
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory
(
    input              rst,
    input      [31:0]  A,
    output     [31:0]  RD
);

reg [31:0] mem [0:1023];

initial
begin
    $readmemh("memfile.hex", mem);
end

assign RD = (rst) ? 32'd0 : mem[A[31:2]];

endmodule
