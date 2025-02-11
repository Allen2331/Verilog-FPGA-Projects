`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 01:45:07 PM
// Design Name: 
// Module Name: equal_1
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


module equal_1(
    input wire a, b,
    output wire eq
    );
    
    wire x, y;
    
    assign eq = x | y;
    
    assign x = a & b;
    assign y = ~a & ~b; 
        
endmodule
