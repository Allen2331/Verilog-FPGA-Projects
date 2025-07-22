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
    
    logic [31:0] memory [mem_depth-1:0];
        
    initial begin
        memory[0] = 32'h002081b3; // add x3, x1, x2
        memory[1] = 32'h0020c1b3; // or  x3, x1, x2
        memory[2]  = 32'h00500113; // addi x2, x0, 5
        memory[3] = 32'h00012383; // lw x7, 0(x2)
        memory[4] = 32'h00712023; // sw x7, 0(x2)
    end
    
    assign instruction_out = memory[pc[31:2]];    
endmodule
