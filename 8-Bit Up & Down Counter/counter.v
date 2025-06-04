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
    input up,
    input down,
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
    reg [7:0] counter = 8'b00000000;
    
    always @(posedge clk) begin
    if (tick) begin
        if(reset)
            counter <= 1'b0;
        else if (counter == 255)
            counter <= 1'b0;
        else 
            if (up) 
            counter <= counter + 1'b1;
            else if (down)
                counter <= (counter == 0) ? 8'd255 : counter - 1;
        end
    end
    
    // Refresh clock
    reg [15:0] refresh_counter = 0;
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
    end
    wire [1:0] digit_sel = refresh_counter[15:14];
    
    // Hex decoder
    reg [3:0] digit_hundreds, digit_tens, digit_ones;
    always @(*) begin
        digit_hundreds = counter / 100;
        digit_tens = (counter % 100) / 10;
        digit_ones = counter % 10;
    end
    
    reg [3:0] current_digit;
    always @(*) begin
        case (digit_sel)
            2'b00: begin
                current_digit = digit_ones;
                an = 4'b1110;
            end
            2'b01: begin
                current_digit = digit_tens;
                an = 4'b1101;
            end
            2'b10: begin
                current_digit = digit_hundreds;
                an = 4'b1011;
            end
            default: begin
                current_digit = 4'b0000;
                an = 4'b1111;
            end
        endcase
    end
    
    // Seven Segment Decoder    
    always @(*) begin
        case (current_digit) 
        4'h0: seven_seg = 7'b0000001; // "0"     
        4'h1: seven_seg = 7'b1001111; // "1" 
        4'h2: seven_seg = 7'b0010010; // "2" 
        4'h3: seven_seg = 7'b0000110; // "3" 
        4'h4: seven_seg = 7'b1001100; // "4" 
        4'h5: seven_seg = 7'b0100100; // "5" 
        4'h6: seven_seg = 7'b0100000; // "6" 
        4'h7: seven_seg = 7'b0001111; // "7" 
        4'h8: seven_seg = 7'b0000000; // "8"     
        4'h9: seven_seg = 7'b0000100; // "9" 
        4'hA: seven_seg = 7'b0001000;
        4'hB: seven_seg = 7'b0000011;
        4'hC: seven_seg = 7'b1000110;
        4'hD: seven_seg = 7'b0100001;
        4'hE: seven_seg = 7'b0000110;
        4'hF: seven_seg = 7'b0001110;
        default: seven_seg = 7'b1111111; // "0"
        endcase
    end
endmodule
