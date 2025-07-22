`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2025 11:33:08 AM
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
    input logic [3:0] ALU_control,
    input logic [31:0] op1, op2,
    output logic [31:0] result
    );
    
    always_comb begin
        case(ALU_control)
            4'b0000: result = op1 + op2; // ADD
            4'b0001: result = op1 - op2; // SUBTRACT
            4'b0010: result = op1 & op2; // AND
            4'b0011: result = op1 | op2; // OR
            4'b0100: result = op1 ^ op2; // XOR
            4'b0101: result = op1 << op2[4:0]; // SLL
            4'b0111: result = op1 >> op2[4:0]; // SRL
            default: result = 0;
        endcase
    end
endmodule
