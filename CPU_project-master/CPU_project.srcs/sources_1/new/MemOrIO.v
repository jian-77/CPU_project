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

module MemOrIO( transit,mRead, mWrite, read, write,addr_in, addr_out, m_rdata, io_rdata, r_wdata, r_rdata, write_data,io_wdata, LEDCtrl, SwitchCtrl,clk,
rst,old_clk,seg_out,seg,left_button,right_button,select_button,seg_out2,seg2);
output reg mRead; // read memory, from Controller
output reg mWrite;  // write memory, from Controller
input read;  // read IO, from Controller
input write;  // write IO, from Controller
input[31:0] addr_in;  // from alu_result in ALU
input[31:0] m_rdata;  // data read from Data-Memory
input[15:0] io_rdata;  // data read from IO,16 bits
input[31:0] r_rdata; // data read from Decoder(register file)
input transit;// go to testcase transition mode
input old_clk;
input clk,rst;
input left_button;
input right_button;
input select_button;

output reg[31:0] addr_out;  // address to Data-Memory
output reg[31:0] r_wdata;  // data to Decoder(register file) 
output reg[31:0] write_data; // data to memory or I/O??m_wdata, io_wdata??
output reg[15:0] io_wdata;
output LEDCtrl; // LED Chip Select
output SwitchCtrl; // Switch Chip Select
output [7:0] seg_out;
output [7:0] seg_out2;
output reg[3:0]seg;
output reg[3:0]seg2;
reg mode;
reg select;
reg [3:0]Test_case;
reg [3:0]t1;
reg [3:0]t2;
reg [3:0]t3;
reg [3:0]t4;
reg [3:0]t5;
reg [3:0]t6;
reg [3:0]t7;
reg [3:0]t8;
reg [4:0]sw;
reg [4:0]sw2;

 parameter   N = 18;      
 reg     [N-1 : 0]  regN; 
    // regN实现对100MHz的系统时钟的2^16分频
    always @ (*)    begin
    seg = 4'b0000;
    seg2 = 4'b0000;
     sw = 5'b11111 ;
     sw2 = 5'b11111 ; // 默认关闭所有段
            
        if (select&& write)begin
        case (regN[N-1: N-2])
            2'b00:  begin
                seg  =  4'b0001;
                seg2  =  4'b0001;
                sw = {1'b0,t5};
                sw2= {1'b0,t1};
            end
            2'b01:  begin
                seg  =  4'b0010;
                seg2 = 4'b0010;
                sw  =  {1'b0,t6};
                sw2 = {1'b0,t2};
            end
            2'b10:  begin
                seg =  4'b0100;
                seg2= 4'b0100;
                sw = {1'b0,t7};
                sw2= {1'b0,t3};
            end
            2'b11:  begin
                seg =  4'b1000;
                seg2=4'b1000;
                sw = {1'b0,t8};
                sw2= {1'b0,t4};
            end
        endcase
        end
        else if(~select)
            begin
                seg =4'b0000;
                seg2=4'b0001;
                sw2={1'b0,t1};
            end
        else 
            begin
               seg =4'b0000;
               seg2=4'b0000;
            end
    end


always @(posedge old_clk or posedge rst)
    begin 
        if (rst)
            begin 
            select<=1'b0;
            end
        else 
        begin
         regN   <=  regN + 1;   
           if(transit) select<=1'b1;
           if(select_button) select<=1'b0;               
        end  
    end

always @* begin 
    case(addr_in[31:12])
        20'hfffff: begin
        // IQ_output
            if(write)
            begin
            io_wdata=r_rdata[15:0];
             t1=r_rdata[3:0];
             t2=r_rdata[7:4];
             t3=r_rdata[11:8];
             t4=r_rdata[15:12];
             t5=r_rdata[19:16];
             t6=r_rdata[23:20];
             t7=r_rdata[27:24];
             t8=r_rdata[31:28];
            end
            else io_wdata=0;
         //IO_input
            if(read)begin 
               if(select)
                   begin
                   if(addr_in[1:0]==2'b01)  r_wdata=16'h3ff;
                   else if(left_button&&addr_in[1:0]==2'b10)  
                   begin r_wdata=16'h1ff;
                         
                   end
                   else if(right_button&&addr_in[1:0]==2'b10) r_wdata=16'h2ff;
                   else r_wdata=io_rdata;
                   end
              else
                  begin
                      if(addr_in[1:0]==2'b01) r_wdata=16'h4ff;                     
                      else 
                          begin 
                          r_wdata=io_rdata;
                          t1=io_rdata[3:0];
                          end
                  end         
            end
        end
        20'h00000: begin
            if(write)begin
                addr_out=addr_in;
                write_data=r_rdata;
                mWrite=write;
            end
            if(read)begin 
                addr_out=addr_in;
                mRead=read;
                r_wdata=m_rdata;
            end
        end
        
        default:begin
        io_wdata=0;
        r_wdata[15:0]=0;
        end
    endcase
end

light_7seg_tube seg_tube(.sw(sw),.seg_out(seg_out));
light_7seg_tube seg_tube2(.sw(sw2),.seg_out(seg_out2));
endmodule
