`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 15:20:41
// Design Name: 
// Module Name: Ifetch_sim
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

module Ifetch_sim(
    );
    reg clk;
    reg rst;
   top top(clk,rst);
    
    initial begin
    clk=1'b1;
    rst=1'b0;
    #1 rst=1'b1;
    #1 rst=1'b0;
    end
   
    always #5 clk=~clk;
   
    
  
endmodule
