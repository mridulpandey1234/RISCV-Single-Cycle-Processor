`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 19:02:44
// Design Name: 
// Module Name: PC
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

module PC
(
    input              clk,
    input              rst,
    input      [31:0]  PC_Next,
    output reg [31:0]  PC
);

always @(posedge clk)
begin
    if(rst)
        PC <= 32'd0;
    else
        PC <= PC_Next;
end

endmodule