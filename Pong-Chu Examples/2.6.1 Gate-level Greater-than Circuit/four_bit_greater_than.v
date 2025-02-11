`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 01:37:06 PM
// Design Name: 
// Module Name: four_bit_greater_than
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


module four_bit_greater_than(
    input [3:0]a, b,
    output out
    );
    
    wire upper_bits, lower_bits, equal_bits;
    
    //Port Instantiation
    two_bit_greater_than upper(.a (a[1:0]), .b(b[1:0]), .eq(x));
    two_bit_greater_than lower(.a (a[3:2]), .b(b[3:2]), .eq(y));
    equal_two_bit equal(.in1(a[3:2]), .in2(b[3:2]), .eq_two(equal_bits));
    
    assign out = x | (y & ~equal_bits);
    
endmodule
