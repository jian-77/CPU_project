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
input rst,
output [15:0] led,
input [15:0] switch,
input transit,
input left_button,
input right_button,
input select_button,
output [7:0] seg_out,
output [3:0]seg,
output [7:0] seg_out2,
output [3:0]seg2
);
wire Branch,Zero,ALUsrc,MemRead,MemWrite,MemtoReg,RegWrite,mRead,mWrite;
wire Jump;
wire clk;
wire[2:0] ALUOp;
wire[31:0] PC;
wire[31:0] instruction;  
wire[31:0] dout;
wire[31:0]Read_Data1;
wire[31:0]Read_Data2;
wire [6:0]funct7;
wire[2:0] funct3;
wire [31:0] imm32;
wire [31:0] immediateJump;
wire [31:0]ALUResult;
wire [31:0]addr_out;
wire [31:0]write_data;
wire [31:0]m_rdata;



cpuclk clk1(.clk_in1(old_clk),.clk_out1(clk));
IFetch ifetch_instance (
        .clk(clk),
        .rst(rst),
        .imm32(imm32),
        .immediateJump(immediateJump),
        .Branch(Branch),
        .Zero(Zero),
        .Jump(Jump),
        .PC(PC),
        .instruction(instruction)
    );
Controller controller_instance (
            .instruction(instruction),
            .Branch(Branch),
            .ALUsrc(ALUsrc),
            .MemRead(MemRead),
            .MemWrite(MemWrite),
            .MemtoReg(MemtoReg),
            .RegWrite(RegWrite),
            .Jump(Jump),
            .ALUOp(ALUOp)
        );
        
  Decoder decoder_instance (
      .clk(clk),
      .rst(rst),
      .PC(PC),
      .instruction(instruction),
      .dout(dout),
      .ALUResult(ALUResult),
      .memToReg(MemtoReg),
      .regWrite(RegWrite),
      .read_data1(Read_Data1),
      .read_data2(Read_Data2),
      .imm32(imm32),
      .immediateJump(immediateJump),
      .funct7(funct7),
      .funct3(funct3)
  );
ALU alu(Read_Data1,Read_Data2,imm32,ALUOp, funct7, funct3, ALUsrc,Zero,ALUResult);
DMem dmem(.clk(clk),.MemRead(mRead),.MemWrite(mWrite),.addr(addr_out),.din(write_data),.dout(m_rdata),.instruction(instruction),.funct3(funct3));
MemOrIO memorio( 
    .write(MemWrite),
    .addr_in(ALUResult),
    .r_rdata(Read_Data2),
    .io_wdata(led),
    .read(MemRead),
    .r_wdata(dout),
    .io_rdata(switch),
    .transit(transit),
    .mRead(mRead),
    .mWrite(mWrite),
    .addr_out(addr_out),
    .write_data(write_data),
    .m_rdata(m_rdata),
    .clk(clk),
    .rst(rst),
    .old_clk(old_clk),
    .seg_out(seg_out),
    .seg(seg),
    .seg_out2(seg_out2),
     .seg2(seg2),
    .left_button(left_button),
    .right_button(right_button),
    .select_button(select_button));
    
endmodule
