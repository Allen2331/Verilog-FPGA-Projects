`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2025 09:41:40 AM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory #(parameter mem_size = 1024, parameter mem_depth = mem_size/4, parameter addr_width = $clog2(mem_depth)) (
    input logic [31:0] pc,
    output logic [31:0] instruction_out
    );
    
    logic [31:0] instruction_memory [mem_depth-1:0];
    
    parameter instructions = ".../instructions.hex"; // Add data path to instruction hex file
    
    initial begin
        $readmemh(instructions, instruction_memory);
    end
    
    assign instruction_out = instruction_memory[pc[31:2]];    
endmodule
