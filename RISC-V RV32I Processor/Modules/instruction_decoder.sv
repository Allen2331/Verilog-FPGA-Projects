`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2025 12:16:08 PM
// Design Name: 
// Module Name: instruction_decode
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


module instruction_decode(
    input logic [31:0] instruction_in,
    output logic [3:0] ALU_control,
    output logic branch,
    output logic mem_write,
    output logic mem_read,
    output logic reg_write,
    output logic alu_src
    );
    
    wire [6:0] opcode = instruction_in[6:0];
    wire [4:0] rd = instruction_in[7:11];
    wire [2:0] func3 = instruction_in[14:12];
    wire [4:0] rs1 = instruction_in[19:15];
    wire [4:0] rs2 = instruction_in[24:20];
    wire [6:0] func7 = instruction_in[31:25];
    wire [9:0] r_type_operation = {func7, func3};
    // wire imm_out = // something
    always_comb begin
        case(opcode) 
            7'b0110011: begin // R-Type Instructions (Use func7 and func3 to determine operation)
                reg_write = 1;
                alu_src = 1;
                case(r_type_operation) 
                10'b0000000000: ALU_control = 4'b0000; // Add
                10'b0100000000: ALU_control = 4'b0001; // Subtract
                10'b0000000111: ALU_control = 4'b0010; // AND
                10'b0000000110: ALU_control = 4'b0011; // OR
                10'b0000000100: ALU_control = 4'b0100; // XOR
                10'b0000000001: ALU_control = 4'b0101; // Shift left
                10'b0000000101: ALU_control = 4'b0111; // Shift right
                default: ALU_control = 4'b1111; // Invalid
                endcase
            end
            7'b0010011: begin // I-Type Instructions
                reg_write = 1;
                alu_src = 1;
                //imm_out 
                case(func3)
                    3'b000: ALU_control = 4'b0000;// Add immediate
                    3'b111: ALU_control = 4'b0001;// AND immediate
                    3'b110: ALU_control = 4'b0010;// OR immediate
                    3'b100: ALU_control = 4'b0100;// XOR immediate
                    default: ALU_control = 4'b1111; // Invalid
                endcase
            end
            7'b0100011: begin // Store Instructions
                reg_write = 0;
                alu_src = 1;
                mem_write = 1;
                case(func3)
                    3'b000: ALU_control = 4'b0000; // Store word
                    3'b001: ALU_control = 4'b0001; // Store byte
                    3'b010: ALU_control = 4'b0010; // Store halfword
                    default: ALU_control = 4'b1111; // Invalid
                endcase
            end
            7'b0000011: begin // Load Instructions
                reg_write = 1;
                mem_read = 1;
                mem_write = 1;
                alu_src = 1;
                ALU_control = 4'b0000;             
            end
       endcase
    end
endmodule
