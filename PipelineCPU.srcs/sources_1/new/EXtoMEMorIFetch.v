`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 17:45:18
// Design Name: 
// Module Name: EXtoMEMorIFetch
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


module EXtoMEMorIFetch(
    input clk,
    input rst,
    input MemRead,MemWrite,MemtoReg,RegWrite,
    input [31:0] nextPC,
    input [31:0] ALUResult,
    input [4:0] rd,
    output reg [4:0] newRd,
    output reg newMemRead,newMemWrite,newMemtoReg,newRegWrite,
    output reg [31:0] newnextPC,
    output reg [31:0] newALUResult,
    input [31:0] read_data2,
    output reg [31:0] newread_data2
    );
    
    
    always @ (posedge rst or posedge clk) begin
        if(rst) begin
            newMemRead<=0;
            newMemWrite<=0;
            newMemtoReg<=0;
            newRegWrite<=0;
            newnextPC<=0;
            newALUResult<=0;
            newRd<=0;
            newread_data2<=0;
        end
        else begin
            newMemRead<=MemRead;
            newMemWrite<=MemWrite;
            newMemtoReg<=MemtoReg;
            newRegWrite<=RegWrite;
            newnextPC<=nextPC;
            newALUResult<=ALUResult;
            newRd<=rd;
            newread_data2<=read_data2;
        end
    end
endmodule
