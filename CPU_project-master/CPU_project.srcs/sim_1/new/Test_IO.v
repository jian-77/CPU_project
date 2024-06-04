`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 17:37:33
// Design Name: 
// Module Name: Test_IO
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


module Test_IO(
    );
    reg oldClk;
    reg rst;
    reg transit;
    wire [15:0]led;
    reg [15:0] switch;
    wire [7:0] seg_out;
    wire [3:0]seg;
    wire [7:0] seg_out2;
    wire [3:0]seg2;
    wire left_button;
    wire right_button;
    wire select_button;
   top top(oldClk,rst,led,switch,transit,left_button,right_button,select_button,seg_out,seg,seg_out2,seg2);
    
    initial begin
    
    rst=1'b0;
   #500 rst=1'b1;
 #10  rst=1'b0;
   
    end
    initial begin
      
    oldClk = 1'b0;
    forever #5 oldClk=~oldClk;
    end
    

    initial begin
    #30 switch= 16'h1;
    end
endmodule
