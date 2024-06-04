`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 23:28:57
// Design Name: 
// Module Name: MemtoWB
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


module MemtoWB(
input clk,
input rst,
input newMemtoReg,newRegWrite,
input [31:0] newALUResult,
input [4:0] newRd,
output reg newMemtoReg2,newRegWrite2,
output reg [31:0] newALUResult2,
output reg [4:0] newRd2,
input [31:0] dout,
output reg [31:0] newdout

    );
    
always @ (posedge rst or posedge clk) begin
    if(rst) begin
        newALUResult2<=0;
        newdout<=0;
        newMemtoReg2<=0;
        newRegWrite2<=0;
        newRd2<=0;
    end
    else begin
        newALUResult2<=newALUResult;
        newdout<=dout;
        newMemtoReg2<=newMemtoReg;
        newRegWrite2<=newRegWrite;
        newRd2<=newRd;
    end
end
endmodule
