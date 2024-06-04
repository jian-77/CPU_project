`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/19 23:55:45
// Design Name: 
// Module Name: IFtoID
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


module IFtoID(
input clk,
input rst,
input [31:0] instruction,
output reg [31:0] instructionToID
);
    
always @ (posedge rst or posedge clk) begin
    if(rst) begin
        instructionToID<=0;
    end
    else begin
        instructionToID<=instruction;
    end
end



endmodule
