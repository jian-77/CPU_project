`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 23:06:20
// Design Name: 
// Module Name: ALU
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


module ALU(
 input [31:0] ReadData1,
   input [31:0] ReadData2,
   input [31:0] imm32,
   input [1:0] ALUOp,
   input [6:0] funct7,
   input [2:0] funct3,
   input ALUSrc,
   output zero,
   output [31:0] ALUResult
   );
   wire [31:0] MUXResult;
   wire [3:0] ALUControlResult;
   MUX mux(ALUSrc,
   ReadData2,
   imm32,
   MUXResult);
   
   ALUControl alucontrol(ALUOp,
   funct7,
   funct3,
   ALUControlResult);
   
   ALUMain alumain(ReadData1,
   MUXResult,
   funct3,
   ALUControlResult,
   zero,
   ALUResult);
endmodule