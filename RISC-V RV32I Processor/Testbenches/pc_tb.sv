`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2025 11:58:43 AM
// Design Name: 
// Module Name: pc_tb
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


module pc_tb;
    logic clk;
    logic rst;
    logic load;
    logic increment;
    logic [31:0] instruction_in;
    logic [31:0] instruction_out;    
    
    Program_Counter uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .increment(increment),
        .instruction_in(instruction_in),
        .instruction_out(instruction_out)
    );
       
    // Clock generator
    always #5 clk = ~clk;
    
    // Test
    initial begin
        clk = 0;
        rst = 1;
        load = 0;
        increment = 0;
        instruction_in = 32'h00000000;
        
        #10;
        rst = 0;
        
        #10;
        load = 1;
        instruction_in = 32'h00000020;
        
        #10;
        load = 0;
        
        #10;
        increment = 1;
        
        #30;
        increment = 0;
        #10;
        $finish;
    end 
       
    initial begin
        $display("Time(ns) | clk rst load | instruction_in  | instruction_out");
        $monitor("%8t |  %b   %b    %b  | %h | %h", $time, clk, rst, load, instruction_in, instruction_out);
    end
endmodule
