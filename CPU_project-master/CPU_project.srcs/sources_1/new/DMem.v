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
input [31:0]instruction,
input [2:0] funct3,
input [31:0] din,
output reg [31:0] dout
    );
    wire [31:0]dout_old;
    RAM udram(.clka(clk), .wea(MemWrite), .addra(addr[13:0]), .dina(din), .douta(dout_old));
    always @*
    begin
       if(instruction[6:0]==7'b0000011&&funct3==3'b000) 
       dout={{24{dout_old[7]}},dout_old[7:0]};
       else if(instruction[6:0]==7'b0000011&&funct3==3'b100) 
        dout={{24{1'b0}},dout_old[7:0]}; 
        else dout=dout_old;
    end
    
endmodule
