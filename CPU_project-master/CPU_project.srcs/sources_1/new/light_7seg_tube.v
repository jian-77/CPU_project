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
    input [3:0]sw,
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
                4'b0000: seg_out = 8'b1111_1100; //0
                4'b0001: seg_out = 8'b0110_0000; //1
                4'b0010: seg_out = 8'b1101_1010; //2
                4'b0011: seg_out = 8'b1111_0010; //3
                4'b0100: seg_out = 8'b0110_0110; //4
                4'b0101: seg_out = 8'b1011_0110; //5
                4'b0110: seg_out = 8'b1011_1110; //6
                4'b0111: seg_out = 8'b1110_0000; //7
                4'b1000: seg_out = 8'b1111_1110; //8
                4'b1001: seg_out = 8'b1111_0110; //9
                4'b1010: seg_out = 8'b1110_1110; //a
                4'b1011: seg_out = 8'b0011_1110; //b.
                4'b1100: seg_out = 8'b0001_1010; //c.
                4'b1101: seg_out = 8'b0111_1010; //d.
                4'b1110: seg_out = 8'b1001_1110; //e.
                4'b1111: seg_out = 8'b1000_1110; //f.
                default:seg_out = 8'b0000_0000;
            endcase
      end
      
     
       
endmodule
