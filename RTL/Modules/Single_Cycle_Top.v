`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 19:02:44
// Design Name: 
// Module Name: Single_Cycle_Top
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

module Single_Cycle_Top(

    input clk,
    input rst

);

//====================
// Internal Wires
//====================

wire [31:0] PC_Top;
wire [31:0] PC_Next;
wire [31:0] RD_Instr;

wire [31:0] RD1_Top;
wire [31:0] RD2_Top;

wire [31:0] Imm_Ext_Top;

wire [31:0] SrcB;
wire [31:0] ALUResult;

wire [31:0] ReadData;
wire [31:0] Result;

wire RegWrite;
wire ALUSrc;
wire MemWrite;
wire ResultSrc;
wire PCSrc;

wire [1:0] ImmSrc;
wire [2:0] ALUControl;

wire Zero;

//====================
// Program Counter
//====================

PC PC1(

.clk(clk),
.rst(rst),
.PC_Next(PC_Next),
.PC(PC_Top)

);

//====================
// Instruction Memory
//====================

Instruction_Memory IM(

.rst(rst),
.A(PC_Top),
.RD(RD_Instr)

);

//====================
// Register File
//====================

Register_File RF(

.clk(clk),
.rst(rst),
.WE3(RegWrite),

.A1(RD_Instr[19:15]),
.A2(RD_Instr[24:20]),
.A3(RD_Instr[11:7]),

.WD3(Result),

.RD1(RD1_Top),
.RD2(RD2_Top)

);

//====================
// Immediate Generator
//====================

Imm_Extend IE(

.Instr(RD_Instr),
.ImmSrc(ImmSrc),
.Imm_Ext(Imm_Ext_Top)

);

//====================
// Control Unit
//====================

Control_Unit_Top CU(

.Op(RD_Instr[6:0]),
.funct3(RD_Instr[14:12]),
.funct7(RD_Instr[30]),
.Zero(Zero),

.RegWrite(RegWrite),
.ALUSrc(ALUSrc),
.MemWrite(MemWrite),
.ResultSrc(ResultSrc),
.PCSrc(PCSrc),

.ImmSrc(ImmSrc),
.ALUControl(ALUControl)

);

//====================
// ALU Operand Mux
//====================

Mux #(32) SrcBMux(

.A(RD2_Top),
.B(Imm_Ext_Top),
.Sel(ALUSrc),
.Y(SrcB)

);

//====================
// ALU
//====================

ALU ALU1(

.A(RD1_Top),
.B(SrcB),

.ALUControl(ALUControl),

.Result(ALUResult),

.Zero(Zero),
.Carry(),
.Overflow(),
.Negative()

);

//====================
// Data Memory
//====================

Data_Memory DM(

.clk(clk),
.WE(MemWrite),

.A(ALUResult),
.WD(RD2_Top),

.RD(ReadData)

);

//====================
// Write Back Mux
//====================

Mux #(32) ResultMux(

.A(ALUResult),
.B(ReadData),
.Sel(ResultSrc),
.Y(Result)

);

//====================
// Next PC
//====================

// Temporary until branch logic is added

assign PC_Next = PC_Top + 32'd4;

endmodule