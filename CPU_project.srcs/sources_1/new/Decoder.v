`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 23:09:14
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input clk,
    input rst,
    input [31:0] PC,
    input [31:0] instruction, // 输入的32位指令地址
    input [31:0] dout,
    input [31:0] ALUResult,
    input memToReg,
    input regWrite,
    output [31:0] read_data1, // 读出的数据1
    output [31:0] read_data2, // 读出的数据2
    output wire [31:0] imm32,    // 立即数
    output wire [6:0] funct7,
    output wire [2:0] funct3
);

wire [6:0] opcode;
wire [4:0] rs1, rs2, rd;
wire [31:0] writeback;

assign opcode = instruction[6:0];
assign rd     = instruction[11:7];
assign funct3 = instruction[14:12];
assign rs1    = instruction[19:15];
assign rs2    = instruction[24:20];
assign funct7 = instruction[31:25];




ImmGen immgen(
     .PC(PC),
    .instruction(instruction),
    .immediate(imm32)
);

WB wb(
    .memToReg(memToReg),
    .ALUResult(ALUResult),
    .dout(dout),
    .writeback(writeback)
);





RegisterFile RF(
    .clk(clk),
    .rst(rst),
    .read_reg1(rs1),
    .read_reg2(rs2),
    .write_reg(rd),
    .write_data(writeback), // 这里将写数据设置为0，需要根据ALU或数据存储单元的输出来更新
    .regWrite(regWrite),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

endmodule

module ImmGen(
input [31:0] PC,/////////////////////////////修改
input [31:0] instruction,
output reg [31:0] immediate
    );
    wire [6:0] opcode = instruction[6:0]; //提取opcode
    
    always @(*) begin
        case(opcode)
            7'b0110011: begin//R
                immediate= 32'b0;
            end
            7'b0010011: begin//LogicI
                immediate=  {{20{instruction[31]}},instruction[31:20]};  
            end
            7'b0000011: begin//LoadI
                immediate=  {{20{instruction[31]}},instruction[31:20]};  
            end    
            7'b0100011: begin//S
                immediate= {{20{instruction[31]}},instruction[31:25],instruction[11:7]};
            end
            7'b1100011: begin//B
                immediate= {{20{instruction[31]}},instruction[7],instruction[30:25],instruction[11:8],1'b0};
            end
            7'b0110111: begin // lui
                immediate = {instruction[31:12], 12'b0};
            end
            7'b0010111: begin // luipc
                immediate = PC+{instruction[31:12], 12'b0};
            end
            7'b1101111: begin // J
                immediate = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};
            end
            default: begin
                immediate = 32'b0;
            end
        endcase
    end
    
endmodule

module RegisterFile(
    input clk,
    input rst,
    input [4:0] read_reg1,     // 读寄存器1地址
    input [4:0] read_reg2,     // 读寄存器2地址
    input [4:0] write_reg,     // 写寄存器地址
    input [31:0] write_data,   // 写入的数据
    input regWrite,            // 写使能信号
    output reg [31:0] read_data1,  // 读出的数据1
    output reg [31:0] read_data2   // 读出的数据2
);

reg [31:0] registers[31:1]; // 寄存器数组，从1到31（寄存器0永远为0）
always @ * begin
    if(rst) begin
        registers[1]=0;
        registers[2]=0;
        registers[3]=0;
        registers[4]=0;
        registers[5]=0;
        registers[6]=0;
        registers[7]=0;
        registers[8]=0;
        registers[9]=0;
        registers[10]=0;
        registers[11]=0;
        registers[12]=0;
        registers[13]=0;
        registers[14]=0;
        registers[15]=0;
        registers[16]=0;
        registers[17]=0;
        registers[18]=0;
        registers[19]=0;
        registers[20]=0;
        registers[21]=0;
        registers[22]=0;
        registers[23]=0;
        registers[24]=0;
        registers[25]=0;
        registers[26]=0;
        registers[27]=0;
        registers[28]=0;
        registers[29]=0;
        registers[30]=0;
        registers[31]=0;
    end
end


always @* begin
     read_data1 = (read_reg1 != 0) ? registers[read_reg1] : 0;
     read_data2 = (read_reg2 != 0) ? registers[read_reg2] : 0;
    
end

always @(negedge clk) begin
    if (regWrite && (write_reg != 0)) begin
        registers[write_reg] <= write_data;
    end
end

endmodule


module WB(
input memToReg,
input [31:0] ALUResult,
input [31:0] dout,
output reg [31:0] writeback
);

always @(*) begin
    
    if(memToReg)writeback=dout;
    else writeback=ALUResult;
end

endmodule
