`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 19:02:44
// Design Name: 
// Module Name: ALU_Decoder
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

module ALU_Decoder(

    input [1:0] ALUOp,
    input [2:0] funct3,
    input       funct7,

    output reg [2:0] ALUControl

);

always @(*)
begin

case(ALUOp)

2'b00:
    ALUControl = 3'b000;      // ADD

2'b01:
    ALUControl = 3'b001;      // SUB

2'b10:

begin

case(funct3)

3'b000:
begin
    if(funct7)
        ALUControl = 3'b001;  // SUB
    else
        ALUControl = 3'b000;  // ADD
end

3'b111:
    ALUControl = 3'b010;      // AND

3'b110:
    ALUControl = 3'b011;      // OR

3'b010:
    ALUControl = 3'b101;      // SLT

default:
    ALUControl = 3'b000;

endcase

end

default:
    ALUControl = 3'b000;

endcase

end

endmodule
