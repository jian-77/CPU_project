`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 14:53:11
// Design Name: 
// Module Name: top
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


module top(
input old_clk,
input rst
);
wire Branch,Zero,ALUsrc,MemRead,MemWrite,MemtoReg,RegWrite,Jump;
wire clk;
wire[1:0] ALUOp;
wire[31:0] PC;
wire[31:0] instruction;  
wire[31:0] dout;
wire[31:0]Read_Data1;
wire[31:0]Read_Data2;
wire [6:0]funct7;
wire[2:0] funct3;
wire [31:0] imm32;
wire [31:0]ALUResult;
cpuclk clk1(.clk_in1(old_clk),.clk_out1(clk));
Controller controller(instruction,Branch,ALUsrc,MemRead,MemWrite,MemtoReg,RegWrite,Jump,ALUOp);
Decoder decoder(clk,rst,PC,instruction,dout,ALUResult,MemtoReg,RegWrite,Read_Data1,Read_Data2,imm32,funct7,funct3);
ALU alu(Read_Data1,Read_Data2,imm32,ALUOp, funct7, funct3, ALUsrc,Zero,ALUResult);
DMem dmem(clk,MemRead,MemWrite,ALUResult,Read_Data2,dout);

endmodule
