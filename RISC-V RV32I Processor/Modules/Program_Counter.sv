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
    input logic [31:0] pc_in,
    input logic load,
    input logic increment,
    output logic [31:0] pc_out
    );
    
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            pc_out <= 32'h00000000;
        else if (load)
            pc_out <= pc_in;
        else if (increment)
            pc_out <= pc_out + 4;
    end 
endmodule
