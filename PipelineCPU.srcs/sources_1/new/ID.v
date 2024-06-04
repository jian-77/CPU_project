module ID(
    input clk,
    input rst,
    input [4:0] newRd,
    output [4:0] rd,
    input [31:0] instruction, // 输入的32位指令地址
    input [31:0] dout,
    input newRegWrite,newMemtoReg,
    output MemRead,MemWrite,MemtoReg,RegWrite,
    output [31:0] nextPC,
    output [31:0] ALUResult,
    input [31:0] newALUResult,
    output reg [31:0] read_data2, // 读出的数据2
    output [4:0] rs1, rs2,
    input [31:0] forwardResult1,
    input [4:0] forwardReg1,
    input forward1,
    input [31:0] forwardResult2,
    input [4:0] forwardReg2,
    input forward2
);

    wire [6:0] opcode;
    wire [31:0] writeback;
   wire [6:0] funct7;
   wire [2:0] funct3;
   wire [31:0] correctedInstruction;

assign opcode = correctedInstruction[6:0];
assign rd     = correctedInstruction[11:7];
assign funct3 = correctedInstruction[14:12];
assign rs1    = correctedInstruction[19:15];
assign rs2    = correctedInstruction[24:20];
assign funct7 = correctedInstruction[31:25];


reg [31:0] read_data1; // 读出的数据1
wire [31:0] imm32;    // 立即数
wire[1:0] ALUOp;
wire ALUSrc;
wire [31:0] read_data1FromReg;
wire [31:0] read_data2FromReg;



always @* begin 
    if(forward1&&forward2) begin
        if(forwardReg1==rs1&&rs1!=rs2)begin
            read_data1<=forwardResult1;
            if(forwardReg2==rs2)read_data2<=forwardResult2;
            else read_data2<=read_data2FromReg;
        end
        else if(forwardReg1==rs2&&rs1!=rs2)begin
            read_data2<=forwardResult1;
            if(forwardReg2==rs1)read_data1<=forwardResult2;
            else read_data1<=read_data1FromReg;
        end
        else begin
            read_data1<=forwardResult1;
            read_data2<=forwardResult1;
        end
    end
    else if(forward1&&~forward2) begin
        if(forwardReg1==rs1&&rs1!=rs2)begin
            read_data1<=forwardResult1;
            read_data2<=read_data2FromReg;
        end
        else if(forwardReg1==rs2&&rs1!=rs2)begin
            read_data2<=forwardResult1;
            read_data1<=read_data1FromReg;
        end
        else begin
            read_data1<=forwardResult1;
            read_data2<=forwardResult1;
        end
    end
    else if(~forward1&&forward2) begin
        if(forwardReg2==rs1&&rs1!=rs2)begin
            read_data1<=forwardResult2;
            read_data2<=read_data2FromReg;
        end
        else if(forwardReg2==rs2&&rs1!=rs2)begin
            read_data2<=forwardResult2;
            read_data1<=read_data1FromReg;
        end
        else begin
            read_data1<=forwardResult2;
            read_data2<=forwardResult2;
        end
    end
    else begin
        read_data2<=read_data2FromReg;
        read_data1<=read_data1FromReg;
    end
        
end


Controller controller(
correctedInstruction,
Branch,ALUSrc,MemRead,MemWrite,MemtoReg,RegWrite,
ALUOp
);




ALU alu(
read_data1,
read_data2,
imm32,
ALUOp,
funct7,
funct3,
ALUSrc,
Zero,
ALUResult
);


PC pc(
clk,
rst,
Branch,
Zero,
imm32,
nextPC
);



ImmGen immgen(
    .instruction(correctedInstruction),
    .immediate(imm32)
);

WB wb(
    .memToReg(newMemtoReg),
    .ALUResult(newALUResult),
    .dout(dout),
    .writeback(writeback)
);





RegisterFile RF(
    .clk(clk),
    .rst(rst),
    .read_reg1(rs1),
    .read_reg2(rs2),
    .write_reg(newRd),
    .write_data(writeback), // 这里将写数据设置为0，需要根据ALU或数据存储单元的输出来更新
    .regWrite(newRegWrite),
    .read_data1(read_data1FromReg),
    .read_data2(read_data2FromReg)
);

Stall stall(
    .clk(clk),
    .rst(rst),
    .instruction(instruction),
    .correctedInstruction(correctedInstruction),
    .Branch(Branch),
    .Zero(Zero)
);

endmodule

module ImmGen(
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
                immediate = {instruction[31:12], 12'b0};
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
always @ (posedge rst or posedge clk) begin
    if(rst) begin
        registers[1]<=0;
        registers[2]<=0;
        registers[3]<=0;
        registers[4]<=0;
        registers[5]<=0;
        registers[6]<=0;
        registers[7]<=0;
        registers[8]<=0;
        registers[9]<=0;
        registers[10]<=0;
        registers[11]<=0;
        registers[12]<=0;
        registers[13]<=0;
        registers[14]<=0;
        registers[15]<=0;
        registers[16]<=0;
        registers[17]<=0;
        registers[18]<=0;
        registers[19]<=0;
        registers[20]<=0;
        registers[21]<=0;
        registers[22]<=0;
        registers[23]<=0;
        registers[24]<=0;
        registers[25]<=0;
        registers[26]<=0;
        registers[27]<=0;
        registers[28]<=0;
        registers[29]<=0;
        registers[30]<=0;
        registers[31]<=0;
    end
    else begin
        if (regWrite && (write_reg != 0)) begin
        registers[write_reg] <= write_data;
        end
    end
end


always @* begin
     read_data1 = (read_reg1 != 0) ? registers[read_reg1] : 0;
     read_data2 = (read_reg2 != 0) ? registers[read_reg2] : 0;
    
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

module Controller(
input [31:0] instruction,
output reg Branch,ALUsrc,MemRead,MemWrite,MemtoReg,RegWrite,
output reg [1:0] ALUOp
    );
    
  always @(*) begin
  case(instruction[6:0])
             7'b0110011://R
                 begin 
                 Branch = 1'b0;
                 ALUOp =2'b00;
                 ALUsrc =1'b0;
                 MemRead =1'b0;
                 MemWrite =1'b0;
                 MemtoReg =1'b0;
                 RegWrite =1'b1;
                 end
            7'b0000011://LW
                 begin 
                Branch = 1'b0;
                ALUOp =2'b00;
                ALUsrc =1'b1;
                MemRead =1'b1;
                MemWrite =1'b0;
                MemtoReg =1'b1;
                RegWrite =1'b1;
                end
              7'b0100011://SW
                 begin 
                 Branch = 1'b0;
                ALUOp =2'b00;
                ALUsrc =1'b1;
                MemRead =1'b0;
                MemWrite =1'b1;
                MemtoReg =1'b0;
                RegWrite =1'b0;
                 end
             7'b1100011://B
                 begin 
                Branch = 1'b1;
                ALUOp =2'b01;
                ALUsrc =1'b0;
                MemRead =1'b0;
                MemWrite =1'b0;
                MemtoReg =1'b0;
                RegWrite =1'b0;
                 end
              7'b0110111://U
                 begin 
                Branch = 1'b0;
                ALUOp =2'b10;/////
                ALUsrc =1'b1;/////
                MemRead =1'b0;
                MemWrite =1'b0;
                MemtoReg =1'b0;
                RegWrite =1'b1;
                 end
               7'b1101111://J
                 begin 
                 Branch = 1'b0;
                ALUOp =2'b00;/////
                ALUsrc =1'b0;////
                MemRead =1'b0;
                MemWrite =1'b0;
                MemtoReg =1'b0;
                RegWrite =1'b1;
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
                end
              default:
                 begin 
                 Branch = 1'b0;
                ALUOp =2'b00;
                ALUsrc =1'b0;
                MemRead =1'b0;
                MemWrite =1'b0;
                MemtoReg =1'b0;
                RegWrite =1'b0;
                 end
         endcase
  
  
  
  end
endmodule

module Stall(
input clk,
input rst,
input [31:0] instruction,
output reg [31:0] correctedInstruction,
input Branch,
input Zero
);
reg [31:0] oldinstruction1,oldinstruction2,oldinstruction3;
reg phase0,phase1,phase2,phase3;

always @ (posedge rst or posedge clk) begin
    if(rst) begin
        oldinstruction1<=0;
        oldinstruction2<=0;
        oldinstruction3<=0;
    end
    else begin
        oldinstruction1<=instruction;
        oldinstruction2<=oldinstruction1;
        oldinstruction3<=oldinstruction2;
    end
end

always @* begin
    if(oldinstruction1[6:0]==7'b1100011||oldinstruction2[6:0]==7'b1100011||oldinstruction3[6:0]==7'b1100011)begin
        if(phase1||phase2||phase3)begin
            correctedInstruction<=32'b0;
        end
        else begin 
            correctedInstruction<=instruction;
        end
    end
    else begin
        correctedInstruction<=instruction;
    end
end

always @(posedge rst or posedge clk) begin
    if(rst) begin
        phase1<=0;
        phase2<=0;
        phase3<=0;
    end
    else begin
        phase1<=phase0;
        phase2<=phase1;
        phase3<=phase2;
    end
end
always @* begin
    phase0<= Zero&&Branch;
end
        
        wire [5:0] oldrd ,rs1 ,rs2;

        assign oldrd     = oldinstruction1[11:7];
        assign rs1    = instruction[19:15];
        assign rs2    = instruction[24:20];


endmodule