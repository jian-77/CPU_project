`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/07 15:16:12
// Design Name: 
// Module Name: Controller
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


module Controller(
input [31:0] instruction,
output reg Branch,ALUsrc,MemRead,MemWrite,MemtoReg,RegWrite,Jump,
output reg [1:0] ALUOp
    );
    
  always @(*) begin
  case(instruction[6:0])
             7'b0110011://R
                 begin 
                 Branch = 1'b0;
                 if(instruction[14:12]==3'b000&&instruction[31:25]==7'b0100000) ALUOp =2'b10;
                 else ALUOp =2'b00;
                 ALUsrc =1'b0;
                 MemRead =1'b0;
                 MemWrite =1'b0;
                 MemtoReg =1'b0;
                 RegWrite =1'b1;
                 Jump=1'b0;
                 end
            7'b0000011://LW
                 begin 
                Branch = 1'b0;
                ALUOp =2'b01;
                ALUsrc =1'b1;
                MemRead =1'b1;
                MemWrite =1'b0;
                MemtoReg =1'b1;
                RegWrite =1'b1;
                Jump=1'b0;
                end
              7'b0100011://SW
                 begin 
                 Branch = 1'b0;
                ALUOp =2'b01;
                ALUsrc =1'b1;
                MemRead =1'b0;
                MemWrite =1'b1;
                MemtoReg =1'b0;
                RegWrite =1'b0;
                Jump=1'b0;
                 end
             7'b1100011://B
                 begin 
                Branch = 1'b1;
                ALUOp =2'b10;
                ALUsrc =1'b0;
                MemRead =1'b0;
                MemWrite =1'b0;
                MemtoReg =1'b0;
                RegWrite =1'b0;
                Jump=1'b0;
                 end
              7'b0110111://lui
                 begin 
                Branch = 1'b0;
                ALUOp =2'b11;/////
                ALUsrc =1'b1;/////
                MemRead =1'b0;
                MemWrite =1'b0;
                MemtoReg =1'b0;
                RegWrite =1'b1;
                Jump=1'b0;
                 end
               7'b0010111://auipc
                 begin 
                Branch = 1'b0;
                ALUOp =2'b11;/////
                ALUsrc =1'b1;/////
                MemRead =1'b0;
                MemWrite =1'b0;
                MemtoReg =1'b0;
                RegWrite =1'b1;
                Jump=1'b0;
                 end
               7'b1101111://J
                 begin 
                 Branch = 1'b0;
                ALUOp =2'b01;/////
                ALUsrc =1'b0;////
                MemRead =1'b0;
                MemWrite =1'b0;
                MemtoReg =1'b0;
                RegWrite =1'b1;
                Jump=1'b1;
                 end
                 7'b0010011://addi
                 begin 
                Branch = 1'b0;
                ALUOp =2'b00;
                ALUsrc =1'b1;
                MemRead =1'b0;
                MemWrite =1'b0;
                MemtoReg =1'b0;
                RegWrite =1'b1;
                Jump=1'b0;
                end
              default:
                 begin 
                 Branch = 1'b0;
                ALUOp =2'b11;
                ALUsrc =1'b0;
                MemRead =1'b0;
                MemWrite =1'b0;
                MemtoReg =1'b0;
                RegWrite =1'b0;
                Jump=1'b0;
                 end
         endcase

  end
endmodule

