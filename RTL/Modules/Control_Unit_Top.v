`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 19:02:44
// Design Name: 
// Module Name: Control_Unit_Top
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

module Control_Unit_Top(

    input  [6:0] Op,
    input  [2:0] funct3,
    input        funct7,
    input        Zero,

    output       RegWrite,
    output       ALUSrc,
    output       MemWrite,
    output       ResultSrc,
    output       PCSrc,

    output [1:0] ImmSrc,
    output [2:0] ALUControl

);

wire Branch;
wire [1:0] ALUOp;

Main_Decoder MD(

.Op(Op),
.RegWrite(RegWrite),
.ALUSrc(ALUSrc),
.MemWrite(MemWrite),
.ResultSrc(ResultSrc),
.Branch(Branch),
.ImmSrc(ImmSrc),
.ALUOp(ALUOp)

);

ALU_Decoder AD(

.ALUOp(ALUOp),
.funct3(funct3),
.funct7(funct7),
.ALUControl(ALUControl)

);

assign PCSrc = Branch & Zero;

endmodule