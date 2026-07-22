`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 19:02:44
// Design Name: 
// Module Name: Imm_Extend
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
module Imm_Extend(

    input  [31:0] Instr,
    input  [1:0]  ImmSrc,

    output reg [31:0] Imm_Ext

);

always @(*)
begin

    case(ImmSrc)

        // I-Type
        2'b00:
            Imm_Ext = {{20{Instr[31]}},Instr[31:20]};

        // S-Type
        2'b01:
            Imm_Ext = {{20{Instr[31]}},Instr[31:25],Instr[11:7]};

        // B-Type
        2'b10:
            Imm_Ext = {{19{Instr[31]}},
                       Instr[31],
                       Instr[7],
                       Instr[30:25],
                       Instr[11:8],
                       1'b0};

        default:
            Imm_Ext = 32'd0;

    endcase

end

endmodule