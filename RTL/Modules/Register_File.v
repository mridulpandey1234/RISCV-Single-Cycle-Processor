`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 19:02:44
// Design Name: 
// Module Name: Register_File
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

module Register_File
(
    input              clk,
    input              rst,
    input              WE3,

    input      [4:0]   A1,
    input      [4:0]   A2,
    input      [4:0]   A3,

    input      [31:0]  WD3,

    output     [31:0]  RD1,
    output     [31:0]  RD2
);

reg [31:0] Registers [31:0];

assign RD1 = (rst) ? 32'd0 : Registers[A1];
assign RD2 = (rst) ? 32'd0 : Registers[A2];

always @(posedge clk)
begin
    if(WE3)
        Registers[A3] <= WD3;
end

endmodule
