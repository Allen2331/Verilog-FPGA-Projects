`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2025 12:25:51 PM
// Design Name: 
// Module Name: two_bit_greater_than
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


module two_bit_greater_than(
    input wire [1:0]a, b,
    output wire eq
    );
    
    wire msb, lsb, equal;
    
    assign msb = a[1] & ~b[1];
    assign lsb = a[0] & ~b[0];
    assign equal = a[1] & b[1];
        
    assign eq = msb | (lsb & ~equal);
    
endmodule