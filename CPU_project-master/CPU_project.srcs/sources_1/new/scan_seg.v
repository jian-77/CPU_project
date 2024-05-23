`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/17 17:02:26
// Design Name: 
// Module Name: scan_seg
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


module scan_seg(
input rst,
input clk,
input wire [3:0] in3, in2, in1, in0,
output reg [3:0] segs,
output [7:0] seg_out
);
parameter N = 3;
reg [N-1:0] regN; 
reg [3:0] hex_in;
always @ (posedge clk or posedge rst) begin
    if (rst) begin 
    regN<=0;
    segs <= 4'b0001;
    end 
    else regN <= regN + 1;
    end
    
    //use regN to realize 2^16 frequency division of clk
    always @ (*) begin
    case (regN[N-1: N-2])
        2'b01:  begin
            segs <= 4'b0010;
            hex_in <= in1;
        end
        2'b10:  begin
            segs <= 4'b0100;
            hex_in <= in2;
        end
        2'b11:  begin
            segs <= 4'b1000;
            hex_in <= in3;
        end
        2'b00:begin
            segs <= 4'b0001;
            hex_in <= in0;
        end        
endcase
end
light_7seg_tube seg_tube3(.sw(hex_in),.seg_out(seg_out));
endmodule
