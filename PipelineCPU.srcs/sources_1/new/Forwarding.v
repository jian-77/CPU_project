`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/21 23:36:36
// Design Name: 
// Module Name: Forwarding
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


module Forwarding(
    input [4:0] newRd,
    input [31:0] newALUResult,
    input [4:0] rs1, rs2,
    output reg [31:0] forwardResult1,
    output reg [4:0] forwardReg1,
    output reg [31:0] forwardResult2,
    output reg [4:0] forwardReg2,
    output reg forward1,
    output reg forward2,
    input [31:0] newALUResult2,
    input [4:0] newRd2,
    input newMemRead, 
    input [31:0] dout,newdout,
    input newMemtoReg2   
    );
   
    
    always @* begin
        if(newRd==rs1&&newRd!=0)begin
            forward1<=1;
            forwardResult1<=newMemRead==1?dout:newALUResult;
            forwardReg1<=rs1;
        end
        else if(newRd==rs2&&newRd!=0) begin
            forward1<=1;
            forwardResult1<=newMemRead==1?dout:newALUResult;
            forwardReg1<=rs2;
        end
        else forward1<=0;
    end
    always @* begin
        if(newRd2==rs1&&newRd!=0)begin
        
            forward2<=1;
            forwardResult2<=newMemtoReg2==0?newALUResult2:newdout;
            forwardReg2<=rs1;
        
        end
        else if(newRd2==rs2&&newRd!=0) begin
        
            forward2<=1;
            forwardResult2<=newMemtoReg2==0?newALUResult2:newdout;
            forwardReg2<=rs2;
        
        end
        else forward2<=0;
    end
endmodule
