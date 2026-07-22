`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 19:02:44
// Design Name: 
// Module Name: ALU
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


module ALU(
    input  signed [31:0] A,
    input  signed [31:0] B,
    input        [2:0]  ALUControl,

    output reg signed [31:0] Result,
    output                  Zero,
    output reg              Carry,
    output reg              Overflow,
    output                  Negative
);

reg [32:0] temp;

always @(*) begin

    Carry     = 1'b0;
    Overflow  = 1'b0;

    case(ALUControl)

        // ADD
        3'b000: begin
            temp   = {1'b0,A} + {1'b0,B};
            Result = temp[31:0];
            Carry  = temp[32];

            Overflow =
                (~A[31] & ~B[31] & Result[31]) |
                ( A[31] &  B[31] & ~Result[31]);
        end

        // SUB
        3'b001: begin
            temp   = {1'b0,A} - {1'b0,B};
            Result = temp[31:0];
            Carry  = temp[32];

            Overflow =
                (~A[31] &  B[31] & Result[31]) |
                ( A[31] & ~B[31] & ~Result[31]);
        end

        // AND
        3'b010:
            Result = A & B;

        // OR
        3'b011:
            Result = A | B;

        // SLT
        3'b101:
            Result = (A < B) ? 32'd1 : 32'd0;

        default:
            Result = 32'd0;

    endcase

end

assign Zero     = (Result == 32'd0);
assign Negative = Result[31];

endmodule