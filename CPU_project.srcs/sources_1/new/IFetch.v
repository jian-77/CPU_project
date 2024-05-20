`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 20:47:33
// Design Name: 
// Module Name: IFetch
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


module IFetch(
input clk,
input rst,
input [31:0] imm32,
input Branch,Zero,Jump,
output reg [31:0] PC,
output  [31:0] instruction
    );
    reg [31:0] next_PC;
    
    always @(posedge clk or posedge rst) begin
        if(rst) PC<=32'b0;
        else begin
            PC<=next_PC;
        end
    end
    
    always @* begin    //让跳转判断及时变化，不等到下降沿再变
        begin
            if ((Branch&&Zero)||Jump) begin
                next_PC<=PC+imm32;
            end
            else next_PC<=PC+4;
        end
    end
    


 reg [13:0] addr; // Changed to reg type
       always @* begin // Changed to combinational block
           addr = PC[15:2];
       end
   InstMem imem(.clka(~clk),.addra(addr),.douta(instruction));
    
   
    
    
endmodule
