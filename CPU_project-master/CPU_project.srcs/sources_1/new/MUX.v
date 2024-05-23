`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 23:01:23
// Design Name: 
// Module Name: MUX
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


module MUX(
  input ALUSrc,
  input [31:0] ReadData2,
  input [31:0] imm32,
  output reg [31:0] MUXResult
  );
  always @ * 
     if(ALUSrc)MUXResult= imm32;
     else MUXResult=ReadData2;
endmodule
