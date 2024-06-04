module MemOrIO( mRead, mWrite, read, write,addr_in, addr_out, m_rdata, io_rdata, r_wdata, r_rdata, write_data,io_wdata, LEDCtrl, SwitchCtrl);
output reg mRead; // read memory, from Controller
output reg mWrite;  // write memory, from Controller
input read;  // read IO, from Controller
input write;  // write IO, from Controller
input[31:0] addr_in;  // from alu_result in ALU
input[31:0] m_rdata;  // data read from Data-Memory
input[15:0] io_rdata;  // data read from IO,16 bits
input[31:0] r_rdata; // data read from Decoder(register file)

output reg[31:0] addr_out;  // address to Data-Memory
output reg[31:0] r_wdata;  // data to Decoder(register file) 
output reg[31:0] write_data; // data to memory or I/O（m_wdata, io_wdata）
output reg[15:0] io_wdata;
output LEDCtrl; // LED Chip Select
output reg SwitchCtrl; // Switch Chip Select


//sw, 输入addr，data from register，控制信号mwrite，iowrite 输出 io_wdata

always @* begin
    
    case(addr_in[31:12])
        20'hfffff: begin
            if(write)io_wdata=r_rdata[15:0];
            else io_wdata=0;
            if(read)begin 
                SwitchCtrl<=1;
                addr_out<=addr_in;
            end
            else begin
                SwitchCtrl<=0;
                addr_out<=0;
            end
        end
        32'h00000: begin
            if(write)begin
                addr_out=addr_in;
                write_data=r_rdata;
                mWrite=write;
            end
            if(read)begin 
                addr_out=addr_in;
                mRead=read;
            end
        end
        
        default:begin
        io_wdata<=0;
        r_wdata<=0;
        end
    endcase
end






endmodule