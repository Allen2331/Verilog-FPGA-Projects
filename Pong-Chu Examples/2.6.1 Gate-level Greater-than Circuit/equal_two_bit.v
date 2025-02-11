`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 01:47:03 PM
// Design Name: 
// Module Name: equal_two_bit
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


module equal_two_bit(
    input [1:0]in1, in2, 
    output eq_two
    );
    
    wire x, y;
    
    equal_1 one(.a(in1[0]), .b(in2[0]), .eq(x));
    equal_1 two(.a(in1[1]), .b(in2[1]), .eq(y));
    
    assign eq_two = x & y;
    
endmodule
