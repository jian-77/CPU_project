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
wire key_pulse;
wire key_left;
wire key_right;
wire key_select;
debounce_button b1(clk,rst,transit,key_pulse);
debounce_button b2(clk,rst,left_button,key_left);
debounce_button b3(clk,rst,right_button,key_right);
debounce_button b4(clk,rst,select_button,key_select);
reg pre_pulse1;
reg now_pulse1;
reg pre_pulse2;
reg now_pulse2;
reg pre_pulse3;
reg now_pulse3;
reg pre_pulse4;
reg now_pulse4;
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
reg [3:0]sw;
reg [3:0]sw2;

 parameter   N = 18;      
 reg     [N-1 : 0]  regN; 
    // regN实现对100MHz的系统时钟的2^16分频
    always @ (*)    begin
        if (select&& write)begin
        case (regN[N-1: N-2])
            2'b00:  begin
                seg  =  4'b0001;
                seg2  =  4'b0001;
                sw =  t5;
                sw2= t1;
            end
            2'b01:  begin
                seg  =  4'b0010;
                seg2 = 4'b0010;
                sw  =  t6;
                sw2 = t2;
            end
            2'b10:  begin
                seg =  4'b0100;
                seg2= 4'b0100;
                sw  =  t7;
                sw2= t3;
            end
            2'b11:  begin
                seg =  4'b1000;
                seg2=4'b1000;
                sw  =  t8;
                sw2=t4;
            end
            default:    begin
                seg  =  4'b1111;
                sw  =  t8;
            end
        endcase
        end
        else if(~select)
            begin
                seg =4'b0000;
                seg2=4'b0001;
                sw2=t1;
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
            pre_pulse1<=1'b0;
            now_pulse1<=1'b0;
//            pre_pulse2<=1'b0;
//            now_pulse2<=1'b0;
//            pre_pulse3<=1'b0;
//            now_pulse3<=1'b0;
            pre_pulse4<=1'b0;
            now_pulse4<=1'b0;
            mode<=1'b0;
            select<=1'b0;
            mode<=1'b0;
            select=1'b0;
   //         seg<=4'b0001;
            end
        else 
        begin
         regN    <=  regN + 1;                 
//            if(seg==4'b1000) 
//            begin seg<=4'b0001;
//                  sw<=t5;
//            end
//            else if(seg==4'b0001)
//            begin seg<=4'b0010;
//                  sw<=t6;
//            end
//            else if(seg==4'b0010) 
//            begin seg<=4'b0100;
//                  sw<=t7;
//            end
//            else  
//            begin seg<=4'b1000;
//                  sw<=t8;
//            end;
            
//            if(seg2==4'b1000) begin seg2<=4'b0001;
//            sw2<=t1; end
//            else if(seg2==4'b0001) begin seg2<=4'b0010;
//            sw2<=t2;end
//            else if(seg2==4'b0010)begin seg2<=4'b0100;
//            sw2<=t3;end
//            else  begin seg2<=4'b1000;
//            sw2<=t4;end
            pre_pulse1<=now_pulse1;
            now_pulse1<=key_pulse;
//            pre_pulse2<=now_pulse2;
//            now_pulse2<=key_left; 
//            pre_pulse3<=now_pulse3;
//            now_pulse3<=key_right;
            pre_pulse4<=now_pulse3;
            now_pulse4<=key_select;      
             if(~pre_pulse1 & now_pulse1)
             mode<=~mode;  
//             else if(~pre_pulse2 & now_pulse2)  
//             begin
//                 if(Test_case==4'b1000) Test_case<=4'b0001;
//                 else Test_case<=Test_case+1'b1;
//             end
//             else if(~pre_pulse3 & now_pulse3)  
//              begin
//                  if(Test_case==4'b0001) Test_case<=4'b1000;
//                  else Test_case<=Test_case-1'b1;
//              end 
               else if(~pre_pulse4 & now_pulse4)  
                  select<=~select;
              else 
              begin
              mode<=mode;
              select<=select;
              end                
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
            end
            else io_wdata=0;
         //IO_input
            if(read)begin 
               if(select)
                   begin
                   if(addr_in[1:0]==2'b01)  r_wdata=16'h3ff;
                   else if(mode&&addr_in[1:0]==2'b10)  r_wdata=16'h1ff;
                   else if(!mode&&addr_in[1:0]==2'b10) r_wdata=16'h2ff;
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



//always @* 
//begin
//  if(~select) begin
//  t1<=Test_case[3:0];
//   t2<=4'b0000;
//     t3<=4'b0000;
//     t4<=4'b0000;
//  end
//  else
//  begin
//     if(Test_case==4'b0001||Test_case==4'b0010)
//     begin
//     t1<=io_rdata[3:0];
//     t2<=io_rdata[7:4];
//     t3<=io_rdata[11:8];
//     t4<=io_rdata[15:12];
//     end
//  end
//end

//scan_seg three_seg1(.rst(rst), .clk(old_clk), .in3(t8), .in2(t7), .in1(t6), .in0(t5), .segs(seg), .seg_out(seg_out));
//scan_seg three_seg2(.rst(rst), .clk(old_clk), .in3(t4), .in2(t3), .in1(t2), .in0(t1), .segs(seg2), .seg_out(seg_out2));
light_7seg_tube seg_tube(.sw(sw),.seg_out(seg_out));
light_7seg_tube seg_tube2(.sw(sw2),.seg_out(seg_out2));
endmodule
