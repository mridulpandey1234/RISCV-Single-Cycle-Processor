`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2026 00:14:34
// Design Name: 
// Module Name: Single_Cycle_Top_tb
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

module Single_Cycle_Top_Tb;

    reg clk;
    reg rst;

    // Instantiate DUT
    Single_Cycle_Top DUT(
        .clk(clk),
        .rst(rst)
    );

    // Clock Generation (100 MHz)
    initial
    begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Reset and Simulation
    initial
    begin

        rst = 1'b1;

        #20;

        rst = 1'b0;

        // Run simulation
        #500;

        $finish;

    end

    // Monitor Signals
    initial
    begin
        $monitor("Time=%0t | PC=%h | Instr=%h | ALU=%h | RegWrite=%b",
                  $time,
                  DUT.PC_Top,
                  DUT.RD_Instr,
                  DUT.ALUResult,
                  DUT.RegWrite);
    end

endmodule