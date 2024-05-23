`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/11 20:04:37
// Design Name: 
// Module Name: DMem
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


module DMem(
input clk,
input MemRead,MemWrite,
input [31:0] addr,
input [31:0] din,
output[31:0] dout
    );
    RAM udram(.clka(clk), .wea(MemWrite), .addra(addr[13:0]), .dina(din), .douta(dout));
endmodule
