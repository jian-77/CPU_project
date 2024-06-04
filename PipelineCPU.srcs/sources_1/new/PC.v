`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 09:27:12
// Design Name: 
// Module Name: PC
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


module PC(
input clk,
input rst,
input Branch,
input Zero,
input [31:0] imm32,
output reg [31:0] PC
);
    
    reg [31:0] next_PC;
    
    always @(posedge clk or posedge rst) begin
        if(rst) PC<=4;
        else begin
            PC<=next_PC;
        end
    end
    
    always @* begin    //让跳转判断及时变化，不等到下降沿再变
        begin
            if (Branch&&Zero) begin
                next_PC<=PC+imm32-12;
            end
            else next_PC<=PC+4;
        end
    end
endmodule
