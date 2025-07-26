`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2025 01:56:47 PM
// Design Name: 
// Module Name: rv32i_top
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


module rv32i_top(
    input logic clk,
    input logic rst,
    output logic [31:0] pc_out,
    output logic [31:0] alu_result
    );
    
    logic [31:0] instruction;
    logic [31:0] pc_next;
    
    
    logic [4:0] rs1, rs2, rd;
    assign rs1 = instruction[19:15];
    assign rs2 = instruction[24:20];
    assign rd = instruction[11:7];
    
    logic [3:0] alu_control;
    logic alu_src;
    logic [31:0] op2;
    logic [31:0] read_data1;
    logic [31:0] read_data2;
    
    logic [31:0] imm_out;
    
    logic mem_write;
    logic mem_to_reg;
    logic reg_write;
    logic [31:0] data_out;
    logic [31:0] write_data;
    
    ALU alu_unit (
        .ALU_control(alu_control),
        .op1(read_data1),
        .op2(op2),
        .result(alu_result)
    );
    
    Program_Counter pc(
        .clk(clk),
        .rst(rst),
        .pc_in(pc_next),
        .pc_out(pc_out)
    );
    
    assign pc_next = pc_out + 4;
    
    instruction_decode decoder(
        .instruction_in(instruction),
        .ALU_control(alu_control),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .reg_write(reg_write),
        .alu_src(alu_src)
    );
    
    instruction_memory memory(
        .pc(pc_out),
        .instruction_out(instruction)
    );
    
    register_file register(
        .clk(clk),
        .write_en(reg_write),
        .rs1(rs1),
        .rs2(rs2),
        .rd_addr(rd),
        .rd(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );
    
    sign_extender extend(
        .instruction_in(instruction),
        .imm_out(imm_out)
    );
    
    data_memory data(
        .clk(clk),
        .write_en(mem_write),
        .data_in(read_data2),
        .address(alu_result),
        .data_out(data_out)
    );
    
    mux mux_data(
        .a(alu_result),
        .b(data_out),
        .sel(mem_to_reg),
        .out(write_data)
    );
    
    mux mux_alu_src(
        .a(read_data2),
        .b(imm_out),
        .sel(alu_src),
        .out(op2)
    );
endmodule
