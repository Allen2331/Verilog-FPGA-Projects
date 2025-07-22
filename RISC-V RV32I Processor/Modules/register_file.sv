`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2025 12:19:35 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input logic clk,
    input logic write_en,
    input logic [4:0] rs1,
    input logic [4:0] rs2,
    input logic [4:0] rd_addr, // Address
    input logic [31:0] rd,
    output logic [31:0] read_data1,
    output logic [31:0] read_data2
    );
    
    logic [31:0] registers [31:0];
    
    assign read_data1 = (rs1 == 5'd0) ? 32'd0 : registers[rs1];
    assign read_data2 = (rs2 == 5'd0) ? 32'd0 : registers[rs2];
    
    always_ff @(posedge clk) begin
        if (write_en && rd_addr != 5'd0) begin
            registers[rd] <= rd;
        end
    end
endmodule
