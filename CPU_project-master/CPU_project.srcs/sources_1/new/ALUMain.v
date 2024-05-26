`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 23:03:53
// Design Name: 
// Module Name: ALUMain
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


module ALUMain(
 input signed[31:0] ReadData1,
  input signed[31:0] MUXResult,
   input[2:0] funct3,
   input[3:0] ALUControlResult,
   output reg zero,
   output reg [31:0] ALUResult
   );
   always @ * begin
       case(ALUControlResult)
           4'b0000:ALUResult= ReadData1+MUXResult;//add
           4'b0001: ALUResult=ReadData1-MUXResult;//sub
           4'b0010: ALUResult=ReadData1^MUXResult;//xor
           4'b0011: ALUResult=ReadData1|MUXResult;//or
           4'b0100: ALUResult= ReadData1&MUXResult;//and
           4'b0101: ALUResult=ReadData1<<MUXResult;//б┴ио??
           4'b0110: ALUResult=ReadData1>>MUXResult;//?? 0
           4'b0111: ALUResult=ReadData1>>>MUXResult;//??sign
           4'b1000: ALUResult=ReadData1<MUXResult?1'b1:1'b0;//slt
           4'b1001: ALUResult=$unsigned(ReadData1)<$unsigned(MUXResult)?1'b1:1'b0;//slt
           4'b1010:ALUResult=MUXResult;
           
           default:ALUResult=0;
       endcase
    end

    always @ * begin
        case(funct3)
            3'b000:zero= ALUResult==0?1'b1:1'b0;
            3'b001:zero= ALUResult==0?1'b0:1'b1;
            3'b100:zero=ReadData1<MUXResult?1'b1:1'b0;//blt
            3'b101:zero=ReadData1>=MUXResult?1'b1:1'b0;//bge
            3'b110:zero=$unsigned(ReadData1)<$unsigned(MUXResult)?1'b1:1'b0;//bltu
            3'b111:zero=$unsigned(ReadData1)>=$unsigned(MUXResult)?1'b1:1'b0;//bgeu
        endcase
    end
  
endmodule