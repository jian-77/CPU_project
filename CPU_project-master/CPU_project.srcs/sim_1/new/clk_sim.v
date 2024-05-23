`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/19 14:49:00
// Design Name: 
// Module Name: clk_sim
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


module clk_sim(
    );
    reg clkin;
    wire clkout;
    cpuclk clk2(.clk_in1(clkin),.clk_out1(clkout));
    initial clkin=1'b0;
    always #5 clkin =~clkin;
endmodule
