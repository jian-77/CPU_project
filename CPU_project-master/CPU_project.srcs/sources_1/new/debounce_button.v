`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/19 15:14:05
// Design Name: 
// Module Name: debounce_button
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

module debounce_button(
input clk_20ms,rst,key,
output key_pulse
    );
reg   key_rst_pre_pre; // Define a register-type variable to store the value of a key when triggered 40 ms ago
reg   key_rst_pre; // Define a register-type variable to store the value of a key when triggered 20 ms ago
reg   key_rst; // Define a register variable to store the value of the key that is triggered at the current moment
// Taking advantage of the non-blocking assignment feature, the key state when the two clocks are triggered is stored in two register variables
always @(posedge clk_20ms, negedge rst)
begin
    if(rst) begin
        key_rst<= 1'b0;
        key_rst_pre<=1'b0;
        key_rst_pre_pre<=1'b0;
    end
    else begin
        key_rst<=key;
        key_rst_pre<=key_rst;
        key_rst_pre_pre<=key_rst_pre;
    end
end
assign key_pulse=(key_rst_pre_pre&key_rst_pre&~key_rst)|(key_rst_pre_pre&key_rst_pre&key_rst)|(~key_rst_pre_pre&key_rst_pre&~key_rst);
endmodule
