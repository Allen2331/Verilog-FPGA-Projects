`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2025 12:49:52 PM
// Design Name: 
// Module Name: sign_extender
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


module sign_extender(
    input logic [31:0] instruction_in,
    output logic [31:0] imm_out
    );
    
    logic [6:0] opcode; // First 7 bits of instruction
    
    assign opcode = instruction_in[6:0];
    
    always_comb begin
        case(opcode) 
            7'b0010011: begin // I-Type
                imm_out = {{20{instruction_in[31]}}, instruction_in[31:20]};
            end
            7'b0000011: begin // Load
                imm_out = {{20{instruction_in[31]}}, instruction_in[31:20]};
            end
            7'b0100011: begin // Store
                imm_out = {{20{instruction_in[31]}}, instruction_in[31:25], instruction_in[11:7]};
            end
        endcase
    end
endmodule
