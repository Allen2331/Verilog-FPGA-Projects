`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 02:33:08 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input logic clk, 
    input logic rst, 
    input logic [31:0] instruction_in,
    input logic load,
    input logic increment,
    output logic [31:0] instruction_out
    );
    
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            instruction_out <= 32'h00000000;
        else if (load)
            instruction_out <= instruction_in;
        else if (increment)
            instruction_out <= instruction_out + 4;
    end 
endmodule
