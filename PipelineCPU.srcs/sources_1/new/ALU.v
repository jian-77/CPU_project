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


module ALUControl(
 input [1:0] ALUOp,
   input [6:0] funct7,
   input [2:0] funct3,
   output reg [3:0] ALUControlResult
   );
   always @ *
       case(ALUOp)
           2'b00:
               case(funct3)
                    3'b001:ALUControlResult= 4'b0100;
                    default:ALUControlResult= {ALUOp,2'b10};
               endcase
           2'b01:ALUControlResult= {ALUOp,2'b10};
           2'b10: ALUControlResult=4'b1111;
        default:ALUControlResult=0;
     endcase     
endmodule

module ALUMain(
 input[31:0] ReadData1,
   input[31:0] MUXResult,
   input[2:0] funct3,
   input[3:0] ALUControlResult,
   output reg zero,
   output reg [31:0] ALUResult
   );
   always @ * begin
       case(ALUControlResult)
           4'b0010:ALUResult= ReadData1+MUXResult;
           4'b0110: ALUResult=ReadData1-MUXResult;
           4'b0000: ALUResult= ReadData1&MUXResult;
           4'b0001: ALUResult=ReadData1|MUXResult;
           4'b0100: ALUResult=ReadData1<<MUXResult;
           4'b1100: ALUResult=ReadData1>>MUXResult;
           4'b1101: ALUResult=ReadData1>>>MUXResult;
           4'b1111:ALUResult=MUXResult;
           default:ALUResult=1'bx;
       endcase
    end
    
    always @ * begin
       if(funct3==3'b001) zero= ALUResult==0?1'b0:1'b1;
       else zero= ALUResult==0?1'b1:1'b0;
    end
//  assign zero= ALUResult==0?1'b1:1'b0;
  
endmodule