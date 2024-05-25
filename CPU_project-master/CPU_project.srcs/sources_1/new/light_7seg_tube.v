`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/09 14:36:03
// Design Name: 
// Module Name: 7_seg_tube
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


module light_7seg_tube(
    input [4:0]sw,
 //   input rst,
    output reg [7:0]seg_out
 //   output reg seg_en
    );
//    always @ *begin
//        if(rst)
//            seg_en = 1'b1;
//        else
//            seg_en = 1'b0;
//         end
     always @* begin
            case(sw)
                5'b00000: seg_out = 8'b1111_1100; //0
                5'b00001: seg_out = 8'b0110_0000; //1
                5'b00010: seg_out = 8'b1101_1010; //2
                5'b00011: seg_out = 8'b1111_0010; //3
                5'b00100: seg_out = 8'b0110_0110; //4
                5'b00101: seg_out = 8'b1011_0110; //5
                5'b00110: seg_out = 8'b1011_1110; //6
                5'b00111: seg_out = 8'b1110_0000; //7
                5'b01000: seg_out = 8'b1111_1110; //8
                5'b01001: seg_out = 8'b1111_0110; //9
                5'b01010: seg_out = 8'b1110_1110; //a
                5'b01011: seg_out = 8'b0011_1110; //b.
                5'b01100: seg_out = 8'b0001_1010; //c.
                5'b01101: seg_out = 8'b0111_1010; //d.
                5'b01110: seg_out = 8'b1001_1110; //e.
                5'b01111: seg_out = 8'b1000_1110; //f.
                5'b11111:seg_out = 8'b0000_0000; 
                default:seg_out = 8'b0000_0000;
            endcase
      end
      
     
       
endmodule
