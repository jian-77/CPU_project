`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/17 20:07:02
// Design Name: 
// Module Name: MemOrIO
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

module MemOrIO( mRead, mWrite, ioRead, ioWrite,addr_in, addr_out, m_rdata, io_rdata, r_wdata, r_rdata, write_data, LEDCtrl, SwitchCtrl);
 input mRead; // read memory, from Controller
input mWrite;  // write memory, from Controller
input ioRead;  // read IO, from Controller
input ioWrite;  // write IO, from Controller
input[31:0] addr_in;  // from alu_result in ALU
output[31:0] addr_out;  // address to Data-Memory
input[31:0] m_rdata;  // data read from Data-Memory
input[15:0] io_rdata;  // data read from IO,16 bits
output[31:0] r_wdata;  // data to Decoder(register file) 
input[31:0] r_rdata; // data read from Decoder(register file)
 output reg[31:0] write_data; // data to memory or I/O£¨m_wdata, io_wdata£©
output LEDCtrl; // LED Chip Select
 output SwitchCtrl; // Switch Chip Select



endmodule
