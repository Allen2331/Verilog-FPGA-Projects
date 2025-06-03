`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 11:49:32 PM
// Design Name: 
// Module Name: updown8bit
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


module updown8bit(
    input clk, 
    input reset, 
    output reg [6:0] seven_seg,
    output reg [3:0] an
    );
    
    reg [25:0] clkdiv = 0;
    wire tick = (clkdiv == 26'd50_000_000);
    
    always @(posedge clk) begin
        if (clkdiv == 26'd50_000_000)
            clkdiv <= 0;
        else
            clkdiv <= clkdiv + 1;
    end
    // Up/Down Counter
    reg [3:0] counter = 4'b0000;
    
    always @(posedge clk) begin
    if (tick) begin
        if(reset)
            counter <= 1'b0;
        else if (counter == 9)
            counter <= 1'b0;
        else 
            counter <= counter + 1'b1;
        end
    end
    
    // Seven Segment Decoder    
    always @(*) begin
        an = 4'b0000; // Enables right most display
        case (counter) 
        4'b0000: seven_seg = 7'b0000001; // "0"     
        4'b0001: seven_seg = 7'b1001111; // "1" 
        4'b0010: seven_seg = 7'b0010010; // "2" 
        4'b0011: seven_seg = 7'b0000110; // "3" 
        4'b0100: seven_seg = 7'b1001100; // "4" 
        4'b0101: seven_seg = 7'b0100100; // "5" 
        4'b0110: seven_seg = 7'b0100000; // "6" 
        4'b0111: seven_seg = 7'b0001111; // "7" 
        4'b1000: seven_seg = 7'b0000000; // "8"     
        4'b1001: seven_seg = 7'b0000100; // "9" 
        default: seven_seg = 7'b1111111; // "0"
        endcase
    end
endmodule
