`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 23:02:06
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(
 input [1:0] ALUOp,
   input [6:0] funct7,
   input [2:0] funct3,
   output reg [3:0] ALUControlResult
   );
   always @ *
       case(ALUOp)
           2'b00://R or I
               case(funct3)
                  3'b000: ALUControlResult= 4'b0000;//add
                   3'b100:ALUControlResult= 4'b0010;//xor
                   3'b110:ALUControlResult= 4'b0011;//or
                   3'b111:ALUControlResult= 4'b0100;//and
                   3'b001:ALUControlResult= 4'b0101;//sl
                   3'b101:
                   begin
                    if(funct7==7'h00)
                       ALUControlResult= 4'b0110;//srl
                     else
                     ALUControlResult= 4'b0111;//sra
                     end
                   3'b010:ALUControlResult= 4'b1000;//slt
                   3'b010:ALUControlResult= 4'b1001;//sltu
                   default:ALUControlResult= 4'b1111;
               endcase
           2'b01: ALUControlResult= 4'b0000;//lw or sw
           2'b10://B
               if(funct3==3'b110 || funct3==3'b111 ) 
               ALUControlResult= 4'b1011;
               else ALUControlResult= 4'b0001;
           2'b11: ALUControlResult= 4'b1010;//U
        default:ALUControlResult=4'b1111;
     endcase     
endmodule