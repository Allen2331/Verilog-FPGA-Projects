`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 07:06:01 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input logic clk,
    input logic write_en,
    input logic [31:0] data_in,
    input logic [9:0] address,
    output logic [31:0] data_out
    );
    
    logic [31:0] mem [255:0];
    
    always_ff @(posedge clk) begin
        if (write_en) 
            mem[address[9:2]] <= data_in;
    end
    assign data_out = mem[address[9:2]];
endmodule
